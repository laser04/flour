// Weather
class Weather {
    constructor(city, country) {
      this.apiKey = "bfaa613564b6762cbea175fd750e8735";
      this.country = country;
      this.city = city;
      this.units = "metric";
      this.lang = "kr"
    }
  
    // Fetch Weather from API
    async getWeather() {
      const response = await fetch(`https://api.openweathermap.org/data/2.5/weather?q=${this.city},${this.country}&units=${this.units}&lang=${this.lang}&appid=${this.apiKey}`);
    //   console.log(this.city);
    //   console.log(this.country);
    //   console.log(this.units);
    //   console.log(this.lang);
    //   console.log(this.apiKey);
      const weatherData = await response.json();
      //console.log(weatherData.weather.main);
  
      // weatherData.weather.forEach(weatherObj => {
      //   console.log("Main weather value: ", weatherObj.main);
      // });
      // console.log(weatherData.weather[0].main);
      // console.log("현재온도 : "+weatherData.main.temp);
      // console.log("체감온도 : "+weatherData.main.feels_like);
      // console.log("최저온도 : "+weatherData.main.temp_min);
      // console.log("최고온도 : "+weatherData.main.temp_max);
      // console.log("습도(%) : "+weatherData.main.humidity);
      // console.log("풍속(m/s) : "+weatherData.wind.speed);
      
      return weatherData;
    }  
  
    async getWeatherIcon() {
      const response = await fetch(``)
    }
  
    changeLocation(city, country) {
      this.city = city;
      this.country = country;
    }
  }

  //Storage
  class Storage {
    constructor() {
      this.city;
      this.country;
      this.defaultCity = "seoul";
      this.defaultCountry = "kr";
    }
  
    getLocationData() {
      if (localStorage.getItem("city") === null) {
        this.city = this.defaultCity;
      } else {
        this.city = localStorage.getItem("city");
      }
  
      if (localStorage.getItem("country") === null) {
        this.country = this.defaultCountry;
      } else {
        this.country = localStorage.getItem("country");
      }
  
      return {
        city: this.city,
        country: this.country
      };
    }
  
    setLocationData(city, country) {
      localStorage.setItem("city", city);
      localStorage.setItem("country", country);
    }
  }

  //Ui
  class UI {
    constructor() {
      this.location = document.querySelector("#w-location");
      this.desc = document.querySelector("#w-desc");
      this.string = document.querySelector("#w-string");
      this.details = document.querySelector("#w-details");
      this.humidity = document.querySelector("#w-humidity");
      this.feelsLike = document.querySelector("#w-feels-like");
      this.wind = document.querySelector("#w-wind");
      // Ma
      this.icon = document.querySelector("#w-icon");
    }
  
    paint(weatherData) {
      this.location.textContent = `${weatherData.name}`;  //, ${weatherData.sys.country}
      this.desc.textContent = weatherData.weather[0].description;
      this.string.textContent = weatherData.main.temp.toFixed(1) + "\u2103";
      this.humidity.textContent = `${weatherData.main.humidity}%`;
      this.feelsLike.textContent = `${weatherData.main.feels_like.toFixed(1)}\u2103`;
      this.wind.textContent = `${weatherData.wind.speed}m/s`
      this.details.textContent = `${weatherData.weather[0].main}`;
    //   MA
    this.icon.setAttribute("src", `http://openweathermap.org/img/wn/${weatherData.weather[0].icon}.png`); 
    }
  }


  //App
  // Init storage
const storage = new Storage();

// get stored location data
const weatherLocation = storage.getLocationData();

// Init Weather bject
const weather = new Weather(weatherLocation.city, weatherLocation.country);

// Init UI Object
const ui = new UI();

// Get weather on DOM Load
document.addEventListener("DOMContentLoaded", getWeather);
document.addEventListener("DOMContentLoaded", getLocation);

// Change location event
/*
document.querySelector("#w-change-btn").addEventListener("click", (e) => {
  const city = document.querySelector("#city").value;
  const country = document.querySelector("#country").value;

  weather.changeLocation(city, country);

  storage.setLocationData(city, country);

  getWeather();

  const modalEl = document.querySelector("#locModal");
  const modal = bootstrap.Modal.getInstance(modalEl);

  modal.hide();
});
*/

/** 껫 웨더 */
function getWeather() {
  weather.getWeather()
  .then((weatherData) => {
    ui.paint(weatherData);
  })
  .catch(err => {
    console.log(err);
  });
}


// 미세먼지
function getLocation(callback) {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function (position) {
        var lat = position.coords.latitude;
        var lon = position.coords.longitude;
        if (typeof callback === 'function') {
          callback({ lat, lon });
        }
      });
    } else {
      alert("Geolocation is not supported by this browser.");
    }
  }
  
  getLocation(function (location) {
  console.log(location.lat);
  console.log(location.lon);

  var lat = location.lat;
  var lon = location.lon;
  var apiKey = "bfaa613564b6762cbea175fd750e8735";

  const url = `https://api.openweathermap.org/data/2.5/air_pollution?lat=${lat}&lon=${lon}&appid=${apiKey}`;

  console.log(url);

  fetch(url)
    .then(response => response.json())
    .then(data => {
      var dust = document.querySelector("#w-dust");
      var dustLevel = data['list'][0]['main']['aqi'];
      switch(dustLevel){
        case 1: dustLevel="아주 좋음"; break;
        case 2: dustLevel="좋음"; break;
        case 3: dustLevel="보통"; break;
        case 4: dustLevel="나쁨"; break;
        case 5: dustLevel="매우 나쁨"; break;
      }
      dust.textContent = dustLevel;
    })
    .catch(error => {
      console.error(error);
    });
});



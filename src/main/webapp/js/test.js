var element = $('.floating-chat');

setTimeout(function() {
    element.addClass('enter');
}, 1000);

element.click(openElement);

function openElement() {
    var contacts = element.find('.contacts');
    element.find('>i').hide();
    element.addClass('expand');
    element.find('.contacts').addClass('enter');
    element.off('click', openElement);
    element.find('.top button').click(closeElement);
    contacts.scrollTop(contacts.prop("scrollHeight"));
}

function closeElement() {
    element.find('.contacts').removeClass('enter').hide();
    element.find('>i').show();
    element.removeClass('expand');
    element.find('.top button').off('click', closeElement);
    setTimeout(function() {
        element.find('.contacts').removeClass('enter').show()
        element.click(openElement);
    }, 500);
}
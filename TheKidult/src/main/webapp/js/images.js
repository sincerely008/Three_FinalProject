var JUI = JUI || {};

!function (param) {
	var global = param.g,
		$      = param.jQ;

	JUI.slider = function (selector, options) {

		var container = $(selector),
			detect    = {},
			config    = {
				speed: 1200,
				isSelected : 'active',
				autoPlay : true,
				duration : 4000
			};

		if (!container.length) {
			return;
		}

		$.extend(config, options);

		function setting() {

			detect.$listBox      = container.find('.gallery-list');
			detect.$lists        = detect.$listBox.children('li');
			detect.width         = detect.$listBox.width();
			detect.$indicate     = container.find('.ctrl-box a');
			detect.view          = '.gallery-list';
			detect.indicate      = '.ctrl-box a';
			detect.prev          = '.btn-prev';
			detect.next          = '.btn-next';
			detect.ctrl          = '.btn-ctrl';
			detect.max           = detect.$indicate.length - 1;
			detect.min           = 0;
			detect.currentIndex  = 0;
			detect.selectedIndex = null;
			detect.intervalId    = null;

		}
		setting();


		function next(evt) {

			if (evt.type === 'mouseenter') {
				clearInterval(detect.intervalId);
				return false;
			}

			detect.selectedIndex = detect.currentIndex + 1;
			if (detect.selectedIndex > detect.max) {
				detect.selectedIndex = 0;
			}

			toMove(detect.selectedIndex, detect.width);

		}

		function prev(evt) {

			if (evt.type === 'mouseenter') {
				clearInterval(detect.intervalId);
				return false;
			}

			detect.selectedIndex = detect.currentIndex - 1;
			if (detect.selectedIndex < detect.min) {
				detect.selectedIndex = detect.max;
			}
			toMove(detect.selectedIndex, -detect.width);
		}

		function direction(selectedIndex) {
			return detect.currentIndex < selectedIndex ? 'goToRight' : 'goToLeft';
		}

		function toMove(selectedIndex, offset) {

			if (detect.selectedIndex == detect.currentIndex) return;
			if (detect.$lists.is(':animated')) return;

			detect.$lists.eq(selectedIndex).css({'left': offset}).addClass(config.isSelected);
			detect.$lists.eq(selectedIndex).animate({'left': 0}, config.speed);

			detect.$indicate.eq(detect.currentIndex).removeClass(config.isSelected);
			detect.$indicate.eq(selectedIndex).addClass(config.isSelected);

			detect.$lists.eq(detect.currentIndex).animate({'left': -offset}, config.speed, function () {
				afterMoving(selectedIndex);
			});
		}

		function afterMoving(selectedIndex) {
			detect.$lists.eq(detect.currentIndex).removeClass(config.isSelected);
			detect.currentIndex = selectedIndex;
		}


		$(document)
			.on('click.slide.indicate', detect.indicate, function () {
				detect.selectedIndex = $(this).index();
				var position = direction(detect.selectedIndex),
					offset   = null;

				switch (position) {
					case 'goToRight' :
					offset = detect.width;
					break;
					case 'goToLeft' :
					offset = -detect.width;
				}
				toMove(detect.selectedIndex, offset);
			})
			.on('click.slide.next, mouseenter', detect.next, next)
			.on('click.slide.prev, mouseenter', detect.prev, prev)
			.on('click.slide.ctrl', detect.ctrl, controller);

		function startInterval() {
			detect.intervalId = setInterval(autoMoving, config.duration);
		}

		function autoMoving() {
			$(detect.next).trigger('click');
		}

		config.autoPlay ? startInterval() : controlState();

		function controller() {
			var $target = $(this);
			if($target.is('.auto')) {
				clearInterval(detect.intervalId);
				$target.removeClass('auto').text('재생');
			} else {
				$target.addClass('auto').text('정지');
				startInterval();
			}
		}

		function controlState() {
			$(detect.ctrl).removeClass('auto').text('재생')
		}

		$(detect.view +"," + detect.indicate).on({
			'mouseenter' : function () {
				clearInterval(detect.intervalId);
			},
			'mouseleave' : function () {
				if (!$(detect.ctrl).is('.auto')) {
					return;
				}
				startInterval();
			}
		});

	};

}({g:window,jQ: window.jQuery});

$(function () {
	/**
	 * @param1 필수, @param2 옵션
	 * @param @type selector : 슬라이드 컨테이닝 박스
	 * @param @type {} : 객체 리터럴(옵션값)
	 * 기본값 {isSelected : 'active', speed:400, duration: 2500, autoPlay: true}
	 */

	// 기본 옵션값으로 호출할 경우 옵션 생략가능
	JUI.slider('#slider01');

	// 사용자 정의 옵션값으로 호출
	/*
	JUI.slider('#slider01', {
		speed : 200,
		duration: 4000,
		autoPlay: false
	})
	*/
});

describe('Keyboard events feature', function() {
  'use strict';

  var $input1,
    $input2,
    $input3,
    $timepicker1,
    $timepicker2,
    $timepicker3,
    tp1,
    tp2,
    tp3;

  beforeEach(function () {
    loadFixtures('timepicker.html');

    $input1 = $('#timepicker1');
    $timepicker1 = $input1.timepicker();
    tp1 = $timepicker1.data('timepicker');

    $input2 = $('#timepicker2');
    $timepicker2 = $input2.timepicker({
      template: 'modal',
      showSeconds: true,
      minuteStep: 30,
      secondStep: 30,
      defaultTime: false
    });
    tp2 = $timepicker2.data('timepicker');

    $input3 = $('#timepicker3');
    $timepicker3 = $input3.timepicker({
      defaultTime: '23:15:20',
      showMeridian: false,
      showSeconds: true,
      template: false
    });
    tp3 = $timepicker3.data('timepicker');
  });

  afterEach(function () {
    $input1.data('timepicker').remove();
    $input2.data('timepicker').remove();
    $input3.data('timepicker').remove();
    $input1.remove();
    $input2.remove();
    $input3.remove();
  });

  it('should be able to control element by the arrow keys', function() {
    tp1.setTime('11:30 AM');
    tp1.update();

    $input1.trigger('focus');

    if (tp1.highlightedUnit !== 'hour') {
      tp1.highlightHour();
    }

    expect(tp1.highlightedUnit).toBe('hour', 'hour should be highlighted by default');
    // hours
    $input1.trigger({
      'type': 'keydown',
      'keyCode': 38 //up
    });
    expect(tp1.getTime()).toBe('12:30 PM', '1');
    $input1.trigger({
      'type': 'keydown',
      'keyCode': 40 //down
    });
    expect(tp1.getTime()).toBe('11:30 AM', '2');
    expect(tp1.highlightedUnit).toBe('hour', 'hour should be highlighted');

    $input1.trigger({
      'type': 'keydown',
      'keyCode': 39 //right
    });
    expect(tp1.highlightedUnit).toBe('minute', 'minute should be highlighted');

    //minutes
    $input1.trigger({
      'type': 'keydown',
      'keyCode': 38 //up
    });
    expect(tp1.getTime()).toBe('11:45 AM', '3');
    expect(tp1.highlightedUnit).toBe('minute', 'minute should be highlighted 1');

    $input1.trigger({
      'type': 'keydown',
      'keyCode': 40 //down
    });
    expect(tp1.getTime()).toBe('11:30 AM', '4');
    expect(tp1.highlightedUnit).toBe('minute', 'minute should be highlighted 2');

    $input1.trigger({
      'type': 'keydown',
      'keyCode': 39 //right
    });
    expect(tp1.highlightedUnit).toBe('meridian', 'meridian should be highlighted');

    //meridian
    $input1.trigger({
      'type': 'keydown',
      'keyCode': 38 //up
    });
    expect(tp1.getTime()).toBe('11:30 PM', '5');
    expect(tp1.highlightedUnit).toBe('meridian', 'meridian should be highlighted');

    $input1.trigger({
      'type': 'keydown',
      'keyCode': 40 //down
    });
    expect(tp1.getTime()).toBe('11:30 AM', '6');
    expect(tp1.highlightedUnit).toBe('meridian', 'meridian should be highlighted');

    $input1.trigger({
      'type': 'keydown',
      'keyCode': 37 //left
    });
    expect(tp1.highlightedUnit).toBe('minute', 'minutes should be highlighted');

    // minutes
    $input1.trigger({
      'type': 'keydown',
      'keyCode': 40 //down
    });
    expect(tp1.getTime()).toBe('11:15 AM', '7');

    $input1.trigger({
      'type': 'keydown',
      'keyCode': 37 //left
    });
    expect(tp1.highlightedUnit).toBe('hour', 'hours should be highlighted');

    // hours
    $input1.trigger({
      'type': 'keydown',
      'keyCode': 40 //down
    });
    expect(tp1.getTime()).toBe('10:15 AM', '8');

    $input1.trigger({
      'type': 'keydown',
      'keyCode': 37 //left
    });
    expect(tp1.highlightedUnit).toBe('meridian', 'meridian should be highlighted');

    // meridian
    $input1.trigger({
      'type': 'keydown',
      'keyCode': 40 //down
    });
    expect(tp1.getTime()).toBe('10:15 PM', '9');
  });

  it('should be able to change time via widget inputs in a dropdown', function() {
    var $hourInput = tp1.$widget.find('input.bootstrap-timepicker-hour'),
        $minuteInput = tp1.$widget.find('input0\r�m��   �  䗛v    _keyhttps://www.google.com/xjs/_/js/k=xjs.s.en_GB.NzqO7LzerDU.O/ck=xjs.s.JUk9bGCLc7c.L.W.O/am=QmQABAAAAAAAwB8AHsgISIAAAACAMQAAAAAAAEAhAAHJ7lAAAGDKvAQMAAAQgAAfAYU_hgIigAAAAIAJ7AfI-W8CAC6BTRgAAAAAAAABcAlklAqQKAggAAAAADG1eooPCAGg/d=1/exm=cdos,csi,d,dpf,hsm,jsa/ed=1/dg=2/br=1/rs=ACT90oHIgMGcjX7jrl1V7ivYz8i5VPua-Q/m=CnSW2d,DPreE,EPszLb,Eox39d,GCSbhd,IkchZc,JaEBL,KVWnye,L1AAkb,MB3mMb,NBZ7u,O8k1Cd,OG6ZHd,PekE8b,RL6dv,T6sTsf,T7XTS,TxZWcc,URQPYc,WlNQGd,XMgU6d,ZDfS0b,aa,abd,async,bgd,dvl,eN4qad,fEVMic,fk3mof,foot,iD8Yk,khSAxb,kyn,lli,m6a0l,mUpTid,mu,o02Jie,pB6Zqd,pFsdhd,pkeO3b,qik19b,rHjpXd,sb_wiz,sf,sonic,spch,tIj4fb,tl,tt,uiNkee,xz7cCd,zUPIy,zbML3c?xjs=s1 
https://google.com/�A�Eo��               ��F%/        ��X[5J     c��������Q���#m����e� W0��A�Eo��   z��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
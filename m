Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C5487326D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 01:17:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u791H80A028653
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 8 Aug 2016 18:17:08 -0700
Received: from [128.224.163.139] (128.224.163.139) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 8 Aug 2016 18:17:07 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1470637742.git.dengke.du@windriver.com>
	<d635e401929354af1c2f14155597d94a16e1af76.1470637742.git.dengke.du@windriver.com>
	<CAJTo0LbJMP=RwtDUdZRNgDqCg0vVmfu0covvd_=Xs6oUBcPFdQ@mail.gmail.com>
From: "dengke.du@windriver.com" <dengke.du@windriver.com>
Message-ID: <57A92F11.30706@windriver.com>
Date: Tue, 9 Aug 2016 09:17:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbJMP=RwtDUdZRNgDqCg0vVmfu0covvd_=Xs6oUBcPFdQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bash: fix run-intl ptest failed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Aug 2016 01:17:10 -0000
Content-Type: multipart/alternative;
	boundary="------------080100040805030509040004"

--------------080100040805030509040004
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ross

OK, thanks, I will send it to the upstream later.

//dengke

On 2016年08月08日 19:56, Burton, Ross wrote:
>
> On 8 August 2016 at 07:43, Dengke Du <dengke.du@windriver.com 
> <mailto:dengke.du@windriver.com>> wrote:
>
>     +Upstream-Status: Pending
>
>
> I've a fear of modifying upstream test suites to 'fix" them so that 
> they pass for us, and think that we should be talking with upstream to 
> verify that these are in fact broken test suites and not something 
> else (such as the test using busybox printf instead of bash or 
> something like that).
>
> Ross


--------------080100040805030509040004
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi Ross<br>
    <br>
    OK, thanks, I will send it to the upstream later.<br>
    <br>
    //dengke<br>
    <br>
    <div class="moz-cite-prefix">On 2016年08月08日 19:56, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbJMP=RwtDUdZRNgDqCg0vVmfu0covvd_=Xs6oUBcPFdQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 8 August 2016 at 07:43, Dengke Du
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:dengke.du@windriver.com" target="_blank">dengke.du@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":2v1" class="a3s aXjCH m15668e545278ceb9">+Upstream-Status:
                Pending<br>
              </div>
            </blockquote>
          </div>
          <br>
          I've a fear of modifying upstream test suites to 'fix" them so
          that they pass for us, and think that we should be talking
          with upstream to verify that these are in fact broken test
          suites and not something else (such as the test using busybox
          printf instead of bash or something like that).</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------080100040805030509040004--

Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D31BC601F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 18:21:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Dec 2014 10:00:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,517,1413270000"; 
	d="scan'208,217";a="632771823"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.148])
	([10.219.4.148])
	by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2014 10:00:07 -0800
Message-ID: <5480A12D.1050701@linux.intel.com>
Date: Thu, 04 Dec 2014 12:00:13 -0600
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <cover.1417466732.git.anibal.limon@linux.intel.com>
	<fef682ae2a0028af5d14a4cc82e83208c6a440aa.1417466734.git.anibal.limon@linux.intel.com>
	<CAJTo0LZ6b0SYW7GY5KZ+zC-UGx8+afDif9y5iGTumj7Yycjr_A@mail.gmail.com>
	<CAP71WjzrWaBs-q8i=4UwbMpzsMzOxePXOFAyCCxa0xckwX2pbw@mail.gmail.com>
	<CAJTo0LYXOobX8Nnjy1KrQizBpUTZDdHLjDV0uLzrUGED1iKjoQ@mail.gmail.com>
	<CAP71Wjyjw9xSbwDjzjdYUqTmNcb+W4yGUHtNmk924c1fYOKzmw@mail.gmail.com>
	<CAJTo0LY8s3e_Sdg47pOxktFGEemZpJANxGa=_Jx1x7FrP7Q8DQ@mail.gmail.com>
In-Reply-To: <CAJTo0LY8s3e_Sdg47pOxktFGEemZpJANxGa=_Jx1x7FrP7Q8DQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libdrm: Upgrade to 2.4.58.
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
X-List-Received-Date: Thu, 04 Dec 2014 18:21:21 -0000
Content-Type: multipart/alternative;
	boundary="------------000600060303090309070103"

--------------000600060303090309070103
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I made a patch v2 for this set,

https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=alimon/linux_intel_graphics_2014q3_v2

I'm testing it to send again.

Kind regards.

alimon

On 04/12/14 09:31, Burton, Ross wrote:
>
> On 4 December 2014 at 15:23, Nicolas Dechesne 
> <nicolas.dechesne@linaro.org <mailto:nicolas.dechesne@linaro.org>> wrote:
>
>     i didn't find any other package in -core where we really used a
>     PACKAGECONFIG for doc. so i would vote to simply do like we do in
>     every other packages, e.g.
>
>
> There is an effort by some to improve documentation generation, and 
> this is a fairly easy one to fix, but I'm easy either way.
>
>     By the way, this is not a new problem (sorry I know i reported it on
>     that thread ;-). This change for manpages was done in 2.4.42. So we
>     should not really block the update to 2.4.58, and if you agree on the
>     patch above, i can send it separately.
>
>
> As you've kindly tested it I'll merge a version with --disable unless 
> Anibal is going to go the extra mile.  :)
>
> Ross


--------------000600060303090309070103
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    I made a patch v2 for this set,<br>
    <br>
<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=alimon/linux_intel_graphics_2014q3_v2">https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=alimon/linux_intel_graphics_2014q3_v2</a><br>
    <br>
    I'm testing it to send again.<br>
    <br>
    Kind regards.<br>
    <br>
    alimon<br>
    <br>
    <div class="moz-cite-prefix">On 04/12/14 09:31, Burton, Ross wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LY8s3e_Sdg47pOxktFGEemZpJANxGa=_Jx1x7FrP7Q8DQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 4 December 2014 at 15:23, Nicolas
            Dechesne <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:nicolas.dechesne@linaro.org"
                target="_blank">nicolas.dechesne@linaro.org</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":9rt" class="a3s" style="overflow:hidden">i
                didn't find any other package in -core where we really
                used a<br>
                PACKAGECONFIG for doc. so i would vote to simply do like
                we do in<br>
                every other packages, e.g.<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>There is an effort by some to improve documentation
              generation, and this is a fairly easy one to fix, but I'm
              easy either way.</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":9rt" class="a3s" style="overflow:hidden">
                By the way, this is not a new problem (sorry I know i
                reported it on<br>
                that thread ;-). This change for manpages was done in
                2.4.42. So we<br>
                should not really block the update to 2.4.58, and if you
                agree on the<br>
                patch above, i can send it separately.</div>
            </blockquote>
          </div>
          <br>
          As you've kindly tested it I'll merge a version with --disable
          unless Anibal is going to go the extra mile.  :)</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------000600060303090309070103--

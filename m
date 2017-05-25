Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 61F61605BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 10:08:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4PA8mOC032658
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 25 May 2017 03:08:56 -0700
Received: from [128.224.162.189] (128.224.162.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Thu, 25 May 2017 03:08:47 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1495704204-228972-1-git-send-email-wenlin.kang@windriver.com>
	<CAJTo0Lb2eEw+mSuVgsJEoqN0L7tBJo9Df2gA4ao6q_BSdenaLw@mail.gmail.com>
From: Wenlin Kang <wenlin.kang@windriver.com>
Message-ID: <6a4c8e56-1a13-2710-13db-72c84d04cbaf@windriver.com>
Date: Thu, 25 May 2017 18:08:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb2eEw+mSuVgsJEoqN0L7tBJo9Df2gA4ao6q_BSdenaLw@mail.gmail.com>
X-Originating-IP: [128.224.162.189]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] freetype: Fix some CVE
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
X-List-Received-Date: Thu, 25 May 2017 10:08:56 -0000
Content-Type: multipart/alternative;
	boundary="------------1A44B29F77ABE801E7618154"
Content-Language: en-US

--------------1A44B29F77ABE801E7618154
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年05月25日 17:43, Burton, Ross wrote:
>
> On 25 May 2017 at 10:23, Wenlin Kang <wenlin.kang@windriver.com 
> <mailto:wenlin.kang@windriver.com>> wrote:
>
>     Fix the follow CVE.
>       CVE-2017-7864
>       CVE-2017-7858
>       CVE-2017-7857
>       CVE-2017-8105
>       CVE-2017-8287
>
>
> How many of these are fixed in the 2.8 release, which we should be 
> upgrading to instead of backporting patches as oe-core is now open for 
> upgrades.

Hi Ross

These all have been fixed in the 2.8 release.

>
> Ross


-- 
Thanks,
Wenlin Kang


--------------1A44B29F77ABE801E7618154
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2017年05月25日 17:43, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0Lb2eEw+mSuVgsJEoqN0L7tBJo9Df2gA4ao6q_BSdenaLw@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 25 May 2017 at 10:23, Wenlin Kang
            <span dir="ltr">&lt;<a
                href="mailto:wenlin.kang@windriver.com" target="_blank"
                moz-do-not-send="true">wenlin.kang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div class="">Fix the follow CVE.<br>
                  CVE-2017-7864<br>
                  CVE-2017-7858<br>
                  CVE-2017-7857<br>
                  CVE-2017-8105<br>
                  CVE-2017-8287</div>
            </blockquote>
          </div>
          <br>
          How many of these are fixed in the 2.8 release, which we
          should be upgrading to instead of backporting patches as
          oe-core is now open for upgrades.</div>
      </div>
    </blockquote>
    <br>
    Hi Ross<br>
    <br>
    These all have been fixed in the 2.8 release.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0Lb2eEw+mSuVgsJEoqN0L7tBJo9Df2gA4ao6q_BSdenaLw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Thanks,
Wenlin Kang</pre>
  </body>
</html>

--------------1A44B29F77ABE801E7618154--

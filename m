Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id D89F675D4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 14:10:47 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 48A732202D;
	Tue, 27 Oct 2015 15:10:45 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
	<1443390491-23728-4-git-send-email-dv@pseudoterminal.org>
	<CAJTo0LY2cDqCZe99YZP3bXuTq1bKdMaDAze6aEQJ2N1Vcb-K2g@mail.gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <562F85E4.3090200@pseudoterminal.org>
Date: Tue, 27 Oct 2015 15:10:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY2cDqCZe99YZP3bXuTq1bKdMaDAze6aEQJ2N1Vcb-K2g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] gstreamer1.0-plugins-bad: upgrade to version 1.6.0
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
X-List-Received-Date: Tue, 27 Oct 2015 14:10:48 -0000
Content-Type: multipart/alternative;
	boundary="------------040408000507070602020509"

--------------040408000507070602020509
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/2015 06:20 PM, Burton, Ross wrote:
> Hi Carlos,
>
> On 27 September 2015 at 22:48, Carlos Rafael Giani 
> <dv@pseudoterminal.org <mailto:dv@pseudoterminal.org>> wrote:
>
>     0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch is now
>     in upstream, and therefore not needed as a separate patch anymore.
>
>     Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org
>     <mailto:dv@pseudoterminal.org>>
>
>
> I started looking for pieces to queue for when master re-opens and 
> discovered that this doesn't apply anymore, so the branch will need 
> rebasing.
>
> Cheers,
> Ross

Yes, I know. I am waiting until Jethro is released, then I'll send a v2 
of these patches.

--------------040408000507070602020509
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 10/26/2015 06:20 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LY2cDqCZe99YZP3bXuTq1bKdMaDAze6aEQJ2N1Vcb-K2g@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Hi Carlos,</div>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 27 September 2015 at 22:48, Carlos
            Rafael Giani <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:dv@pseudoterminal.org" target="_blank">dv@pseudoterminal.org</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":2p8" class="a3s" style="overflow:hidden">0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch
                is now<br>
                in upstream, and therefore not needed as a separate
                patch anymore.<br>
                <br>
                Signed-off-by: Carlos Rafael Giani &lt;<a
                  moz-do-not-send="true"
                  href="mailto:dv@pseudoterminal.org"><a class="moz-txt-link-abbreviated" href="mailto:dv@pseudoterminal.org">dv@pseudoterminal.org</a></a>&gt;<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>I started looking for pieces to queue for when master
              re-opens and discovered that this doesn't apply anymore,
              so the branch will need rebasing.</div>
            <div><br>
            </div>
            <div>Cheers,</div>
            <div>Ross</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Yes, I know. I am waiting until Jethro is released, then I'll send a
    v2 of these patches.<br>
  </body>
</html>

--------------040408000507070602020509--

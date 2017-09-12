Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8DF78272
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 01:29:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8C1TE2A008779
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 11 Sep 2017 18:29:14 -0700
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 11 Sep 2017 18:29:13 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1504673600.git.Qi.Chen@windriver.com>
	<2be5bc6d-25e6-f67b-b1eb-12c3febffb81@windriver.com>
	<CAJTo0LbfCBcP3zdLyhy+gPunoaF1Fo0yvy-oRAvuEehNaVYixw@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <fb348686-f51f-dc37-7ed6-bd03ec423f18@windriver.com>
Date: Tue, 12 Sep 2017 09:34:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbfCBcP3zdLyhy+gPunoaF1Fo0yvy-oRAvuEehNaVYixw@mail.gmail.com>
X-Originating-IP: [128.224.162.167]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] python3-pip & python3-setuptools: extend to nativesdk
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
X-List-Received-Date: Tue, 12 Sep 2017 01:29:15 -0000
Content-Type: multipart/alternative;
	boundary="------------D0C0BCBF855A62876C32856A"

--------------D0C0BCBF855A62876C32856A
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2017 11:07 PM, Burton, Ross wrote:
> These are in master-next.
>
> Ross
>

Thanks Ross.

There are three other patch series on the mailing list.
Is it possible for these patches to get into this release? Or we need to 
wait for the development cycle for the next release?
Their titles are:
[OE-core] [PATCH 0/2] systemd: fix dependency issue related to serial getty
[OE-core] [PATCH 0/2] disallow multiple syslog daemons to be installed
[OE-core] [PATCH 0/1] iputils: backport patch to fix arping hang problem

Best Regards,
Chen Qi

> On 11 September 2017 at 02:44, ChenQi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     ping
>
>     On 09/06/2017 12:54 PM, Chen Qi wrote:
>
>         The following changes since commit
>         8b4f16a9cbbaf521461f699b7264fac2ac872581:
>
>            mesa-gl: Fix build after recent mesa PACKAGECONFIG changes
>         (2017-09-05 15:01:02 +0100)
>
>         are available in the git repository at:
>
>            git://git.pokylinux.org/poky-contrib
>         <http://git.pokylinux.org/poky-contrib> ChenQi/python3-nativesdk
>         http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/python3-nativesdk
>         <http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/python3-nativesdk>
>
>         Chen Qi (2):
>            python3-pip: extend to nativesdk
>            python3-setuptools: extend to nativesdk
>
>           meta/recipes-devtools/python/python3-pip_9.0.1.bb
>         <http://python3-pip_9.0.1.bb>  | 2 +-
>           meta/recipes-devtools/python/python3-setuptools_36.2.7.bb
>         <http://python3-setuptools_36.2.7.bb> | 7 ++++---
>           2 files changed, 5 insertions(+), 4 deletions(-)
>
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------D0C0BCBF855A62876C32856A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 09/11/2017 11:07 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbfCBcP3zdLyhy+gPunoaF1Fo0yvy-oRAvuEehNaVYixw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">These are in master-next.
        <div>
          <div><br>
          </div>
          <div>Ross</div>
        </div>
      </div>
      <div class="gmail_extra"><br>
      </div>
    </blockquote>
    <br>
    Thanks Ross.<br>
    <br>
    There are three other patch series on the mailing list.<br>
    Is it possible for these patches to get into this release? Or we
    need to wait for the development cycle for the next release?<br>
    Their titles are:<br>
    [OE-core] [PATCH 0/2] systemd: fix dependency issue related to
    serial getty<br>
    [OE-core] [PATCH 0/2] disallow multiple syslog daemons to be
    installed<br>
    [OE-core] [PATCH 0/1] iputils: backport patch to fix arping hang
    problem<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CAJTo0LbfCBcP3zdLyhy+gPunoaF1Fo0yvy-oRAvuEehNaVYixw@mail.gmail.com"
      type="cite">
      <div class="gmail_extra">
        <div class="gmail_quote">On 11 September 2017 at 02:44, ChenQi <span
            dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">ping<span
              class="im HOEnZb"><br>
              <br>
              On 09/06/2017 12:54 PM, Chen Qi wrote:<br>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">
                The following changes since commit
                8b4f16a9cbbaf521461f699b7264fa<wbr>c2ac872581:<br>
                <br>
                   mesa-gl: Fix build after recent mesa PACKAGECONFIG
                changes (2017-09-05 15:01:02 +0100)<br>
                <br>
                are available in the git repository at:<br>
                <br>
                   git://<a moz-do-not-send="true"
                  href="http://git.pokylinux.org/poky-contrib"
                  rel="noreferrer" target="_blank">git.pokylinux.org/poky-<wbr>contrib</a>
                ChenQi/python3-nativesdk<br>
                   <a moz-do-not-send="true"
href="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/python3-nativesdk"
                  rel="noreferrer" target="_blank">http://git.pokylinux.org/<wbr>cgit.cgi/poky-contrib/log/?h=C<wbr>henQi/python3-nativesdk</a><br>
                <br>
                Chen Qi (2):<br>
                   python3-pip: extend to nativesdk<br>
                   python3-setuptools: extend to nativesdk<br>
                <br>
                  meta/recipes-devtools/python/<a moz-do-not-send="true"
                  href="http://python3-pip_9.0.1.bb" rel="noreferrer"
                  target="_blank">p<wbr>ython3-pip_9.0.1.bb</a>       
                 | 2 +-<br>
                  meta/recipes-devtools/python/<a moz-do-not-send="true"
                  href="http://python3-setuptools_36.2.7.bb"
                  rel="noreferrer" target="_blank">p<wbr>ython3-setuptools_36.2.7.bb</a>
                | 7 ++++---<br>
                  2 files changed, 5 insertions(+), 4 deletions(-)<br>
                <br>
              </blockquote>
              <br>
              -- <br>
            </span>
            <div class="HOEnZb">
              <div class="h5">
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a moz-do-not-send="true"
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  target="_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
                <a moz-do-not-send="true"
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------D0C0BCBF855A62876C32856A--

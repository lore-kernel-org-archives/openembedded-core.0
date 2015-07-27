Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8FA605D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 03:33:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6R3XOI9002042
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 26 Jul 2015 20:33:24 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Sun, 26 Jul 2015 20:33:10 -0700
Message-ID: <55B5A6C6.6090305@windriver.com>
Date: Mon, 27 Jul 2015 11:34:30 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1437728803.git.Qi.Chen@windriver.com>
	<86afb680d9e913990f23af7091b64efb92195c9a.1437728803.git.Qi.Chen@windriver.com>
	<CAJTo0LZwyszc0+A1KNMMPNpWzKKi4SUyMmThXEVj8x=m0Xvy0w@mail.gmail.com>
In-Reply-To: <CAJTo0LZwyszc0+A1KNMMPNpWzKKi4SUyMmThXEVj8x=m0Xvy0w@mail.gmail.com>
X-Originating-IP: [128.224.162.211]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 3/3] sudo: upgrade to 1.8.14p2
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
X-List-Received-Date: Mon, 27 Jul 2015 03:33:27 -0000
Content-Type: multipart/alternative;
	boundary="------------000709070002060308050609"

--------------000709070002060308050609
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2015 04:38 AM, Burton, Ross wrote:
>
> On 24 July 2015 at 10:08, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     The licence checksum is modified according to the change of
>     doc/LICENCE.
>     In specific, file://lib/util/reallocarray.c is added to
>     LIC_FILES_CHECKSUM.
>
>
> This fails to build in systemd builds and in fixing it I discovered 
> that there's a p3 released now, which I submitted to the list earlier.
>
> Ross

Oh, Thanks Ross!

Best Regards,
Chen Qi

--------------000709070002060308050609
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 07/25/2015 04:38 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZwyszc0+A1KNMMPNpWzKKi4SUyMmThXEVj8x=m0Xvy0w@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 24 July 2015 at 10:08, Chen Qi <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":315" class="a3s" style="overflow:hidden">The
                licence checksum is modified according to the change of
                doc/LICENCE.<br>
                In specific, <a class="moz-txt-link-freetext" href="file://lib/util/reallocarray.c">file://lib/util/reallocarray.c</a> is added to
                LIC_FILES_CHECKSUM.</div>
            </blockquote>
            <div><br>
            </div>
            <div>This fails to build in systemd builds and in fixing it
              I discovered that there's a p3 released now, which I
              submitted to the list earlier.</div>
            <div><br>
            </div>
            <div>Ross </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Oh, Thanks Ross!<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
  </body>
</html>

--------------000709070002060308050609--

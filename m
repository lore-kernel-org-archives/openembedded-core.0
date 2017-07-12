Return-Path: <Lev.Iserovich@deshawresearch.com>
Received: from drdwsfe1.nyc.desres.deshaw.com (nyvpn.deshawresearch.com
	[38.109.87.242])
	by mail.openembedded.org (Postfix) with ESMTP id B46567808C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 14:31:16 +0000 (UTC)
Received: from drdws0019.nyc.desres.deshaw.com
	(drdws0019.nyc.desres.deshaw.com [149.77.52.116])
	by drdwsfe1.nyc.desres.deshaw.com (Postfix) with ESMTP id 1AF12EA9FE;
	Wed, 12 Jul 2017 10:31:17 -0400 (EDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1499788671-20890-1-git-send-email-lev.iserovich@deshawresearch.com>
	<CAJTo0LYs38P1M3_YBNWfHq71s3RUMeJW4hGKUtQxBWMbT-HGBA@mail.gmail.com>
From: Lev Iserovich <Lev.Iserovich@deshawresearch.com>
Message-ID: <a41b7c3c-fd67-9cd2-a427-90fec4037af8@deshawresearch.com>
Date: Wed, 12 Jul 2017 10:31:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYs38P1M3_YBNWfHq71s3RUMeJW4hGKUtQxBWMbT-HGBA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gettext: Enable generation of libasprintf in gettext 0.19
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
X-List-Received-Date: Wed, 12 Jul 2017 14:31:16 -0000
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 07/12/2017 06:03 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYs38P1M3_YBNWfHq71s3RUMeJW4hGKUtQxBWMbT-HGBA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 11 July 2017 at 16:57, Lev
            Iserovich <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:lev.iserovich@deshawresearch.com"
                target="_blank">lev.iserovich@deshawresearch.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":35x" class="a3s aXjCH m15d326fc46fecac5">Libasprintf
                was included in <span class="il">gettext</span> 0.16
                recipe, but omitted for some reason<br>
                in 0.19. This turns it back on.<br>
              </div>
            </blockquote>
          </div>
          <br>
          As this pulls C++ libraries into the core package, can it be
          split out like the other libraries?</div>
      </div>
    </blockquote>
    Sure, I can do that - can you point to some prior art for how this
    is generally done?<br>
    <br>
    Lev<br>
  </body>
</html>


Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EFB397214B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 02:24:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAL2OZPx003621
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 20 Nov 2014 18:24:35 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 20 Nov 2014 18:24:35 -0800
Message-ID: <546EA266.8000501@windriver.com>
Date: Fri, 21 Nov 2014 10:24:38 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1415953970.git.Qi.Chen@windriver.com>
	<CAJTo0LbyscwOWnw9Ni+4CK4xdGT55wjwUUcGCWhqPXh6u2x3Lg@mail.gmail.com>
In-Reply-To: <CAJTo0LbyscwOWnw9Ni+4CK4xdGT55wjwUUcGCWhqPXh6u2x3Lg@mail.gmail.com>
X-Originating-IP: [128.224.162.226]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Use ALTERNATIVES to manage 'nologin'
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
X-List-Received-Date: Fri, 21 Nov 2014 02:24:44 -0000
Content-Type: multipart/alternative;
	boundary="------------070802030004020505040303"

--------------070802030004020505040303
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2014 04:42 AM, Burton, Ross wrote:
>
> On 14 November 2014 08:35, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Chen Qi (2):
>       util-linux: use ALTERNATIVE mechanism to manage 'nologin'
>       shadow: use ALTERNATIVE to manage 'nologin'
>
>
> util-linux has been changed since this was sent, can you rebase please?
>
> Cheers,
> Ross

OK. I'll send out V2.

Best Regards,
Chen Qi

--------------070802030004020505040303
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 11/21/2014 04:42 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbyscwOWnw9Ni+4CK4xdGT55wjwUUcGCWhqPXh6u2x3Lg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 14 November 2014 08:35, Chen Qi <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":457" class="a3s" style="overflow:hidden">Chen Qi
                (2):<br>
                  util-linux: use ALTERNATIVE mechanism to manage
                'nologin'<br>
                  shadow: use ALTERNATIVE to manage 'nologin'</div>
            </blockquote>
          </div>
          <br>
          util-linux has been changed since this was sent, can you
          rebase please?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Cheers,</div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    OK. I'll send out V2.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
  </body>
</html>

--------------070802030004020505040303--

Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1Tsd0m-0006HL-KM
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 18:31:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r08HFe9k009070
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2013 09:15:40 -0800 (PST)
Received: from [128.224.171.150] (128.224.171.150) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 8 Jan 2013 09:15:40 -0800
Message-ID: <50EC543B.8050105@windriver.com>
Date: Tue, 8 Jan 2013 19:15:39 +0200
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded <openembedded-core@lists.openembedded.org>
References: <50EB3FF4.60601@windriver.com>
	<CABcZAN=nVVoNxdu7tZKQ=uK5Q7jcCrhvFezX-YYpyWPZbTw9jg@mail.gmail.com>
	<50EBB80A.2090704@windriver.com> <50EC29E9.7000500@windriver.com>
	<CAK18fxHUuzTMsBGVPZYYFnEcVwop78OHsqhqoT1V6jAYKVHdrg@mail.gmail.com>
In-Reply-To: <CAK18fxHUuzTMsBGVPZYYFnEcVwop78OHsqhqoT1V6jAYKVHdrg@mail.gmail.com>
Subject: Re: alsaconf and bash
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 17:31:10 -0000
Content-Type: multipart/alternative;
	boundary="------------030107050408070504020506"

--------------030107050408070504020506
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

But on the other hand, if the comment says the script is not suited for 
OE-core, then why have the alsa-utils rpm depend on the alsaconf rpm?

Florin

On 01/08/2013 06:27 PM, Andrei Gherzan wrote:
> On Tue, Jan 8, 2013 at 4:15 PM, Florin Sarbu 
> <florin.sarbu@windriver.com <mailto:florin.sarbu@windriver.com>> wrote:
>
>     Would you guys suggest we add bash as a dependency for alsa-utils?
>
>
> Alsaconf is a bash script - obviously add a RDEPENDS to bash.
>
> ag


--------------030107050408070504020506
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">But on the other hand, if the comment
      says the script is not suited for OE-core, then why have the
      alsa-utils rpm depend on the alsaconf rpm?<br>
      <br>
      Florin<br>
      <br>
      On 01/08/2013 06:27 PM, Andrei Gherzan wrote:<br>
    </div>
    <blockquote
cite="mid:CAK18fxHUuzTMsBGVPZYYFnEcVwop78OHsqhqoT1V6jAYKVHdrg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <div dir="ltr">On Tue, Jan 8, 2013 at 4:15 PM, Florin Sarbu <span
          dir="ltr">&lt;<a moz-do-not-send="true"
            href="mailto:florin.sarbu@windriver.com" target="_blank">florin.sarbu@windriver.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div bgcolor="#FFFFFF" text="#000000">
                <div>Would you guys suggest we add bash as a dependency
                  for alsa-utils?</div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div style="">Alsaconf is a bash script - obviously add a
              RDEPENDS to bash.</div>
            <div style=""><br>
            </div>
            <div style="">ag</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------030107050408070504020506--

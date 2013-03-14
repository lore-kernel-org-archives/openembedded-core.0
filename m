Received: from mail-ob0-f169.google.com ([209.85.214.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UG7Rv-0002Ws-1z
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 13:40:08 +0100
Received: by mail-ob0-f169.google.com with SMTP id ta14so2118734obb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2013 05:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=A9hpL97jRzXB3JKRXBasw1YU6VfkCf/l+WTn+m25MYw=;
	b=x8jK+k4sX2+1KpJUxR5GEVyoySMNDfYf6uMeCnLC3kiFw4jjwMINXux0eyOFdcIrjT
	Ja0+zRSYB1YiFsjUnT5mAu4L7Nx4WkQZxdrXJN79CU++D7rr8mPcUkMkKAXFpuQw2Tta
	xDYcthaiKbM1CC8mpA4vhd4QUUkTDvaD9unjK8GBK4KOs0o6VcrciqVGP1avD3V6Q2Y/
	dWhfuvsu1kzsIFp75S5jxf2zjGtJZ8kdDEhzwUwOGgHwG4GCFadEwS4aQuasqmYIbb07
	3dLNtpV/VS1rFofum7HIFw8dhBmrm8EnH236r1WL0cpciiuBpGaoM7x5aNFjj8Y3KDd5
	RE9A==
MIME-Version: 1.0
X-Received: by 10.60.8.40 with SMTP id o8mr960275oea.112.1363263796448; Thu,
	14 Mar 2013 05:23:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Thu, 14 Mar 2013 05:23:16 -0700 (PDT)
In-Reply-To: <1363207361-30883-1-git-send-email-jslater@windriver.com>
References: <1363207361-30883-1-git-send-email-jslater@windriver.com>
Date: Thu, 14 Mar 2013 09:23:16 -0300
X-Google-Sender-Auth: nyL6TZy4MZLvirOkYidH6U5nVSA
Message-ID: <CAP9ODKrT0EvySNSV2B=S8UsESX7sDUfiver2XdYL3DyK-+Y9fw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Joe Slater <jslater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzcode & tzdata: update to 2013b versions
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
X-List-Received-Date: Thu, 14 Mar 2013 12:40:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 13, 2013 at 5:42 PM, Joe Slater <jslater@windriver.com> wrote:
> Update tzcode and tzdata recipes for 2013b timezone
> data.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>

This is the v2, right? Please list which changes you did since v1.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br



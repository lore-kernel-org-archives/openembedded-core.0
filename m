Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R4IHY-0002Vm-H1
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 22:11:36 +0200
Received: by bke11 with SMTP id 11so3010633bke.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 13:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=rpeoH0iZS/B2Do+5XQ5VRyoEDRn/MNdrGJG1OB1ZGBM=;
	b=uZEm/bIGjaMLAcczUeTQUJzVmsI0tKyd5fs6jZsJd9p3h0Qg32DzdvI2VqzdMeDWT4
	jBpFrEkzwa/OV8oerEaPLwWTUq24OiVYTJOhzd2wRGlcXy5aDQ80MjQSMePimfj1uSfY
	vwBmieqg1HYSvSXS4IEqOqAg90ksXYYC0HX3w=
MIME-Version: 1.0
Received: by 10.204.138.219 with SMTP id b27mr575834bku.218.1316117183077;
	Thu, 15 Sep 2011 13:06:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Thu, 15 Sep 2011 13:06:22 -0700 (PDT)
In-Reply-To: <4E7246EB.2070607@eukrea.com>
References: <20110911172241.GA3674@chargestorm.se>
	<1315762415-18070-1-git-send-email-eric@eukrea.com>
	<201109121134.42474.paul.eggleton@linux.intel.com>
	<FF2EB738-77F7-4BC5-BB83-82ED8CBC0F96@dominion.thruhere.net>
	<1316107938.1058.80.camel@swold-mobl.bigsur.com>
	<4E7246EB.2070607@eukrea.com>
Date: Thu, 15 Sep 2011 17:06:22 -0300
X-Google-Sender-Auth: kZxJtiwn6P5l8jFp72AqCBJi2oE
Message-ID: <CAP9ODKqCc3zAuwBoL7Yiet0GKuJKFymZMtStkpwAq88b=ZGibw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2011 20:11:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2011 at 15:41, Eric B=E9nard <eric@eukrea.com> wrote:
...
> Btw, this patch is only a minor update of qt so this would be interesting=
 to
> have it into the 1.1 release imho.

I agree with Eric that this is important to have into the release; rc
is OK to skip it but for final seems good to have it in.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



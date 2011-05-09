Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJUaf-0004T1-Dh
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 19:49:53 +0200
Received: by wwb17 with SMTP id 17so4959382wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2011 10:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=cSaorH+3vcx6Dt5oYKxMjwRMi/TR8uwtuZxXPyUDTnc=;
	b=DqHKUTM+PGQQiYJvPiZdw9AzyVOCzbH4PcRtNAZKsPhwvlaTeimg13v1AXFMLjjS2E
	eVNUYEnHBpv/SbIzB9lHKTdU8HUcgDmS5RasSxJIkGvK+oOzllcs0d5UFJhkn2AoFJhC
	sd0RLr/MXJ9/z+2Y3ob4bmIiJEhMAKYF7Wzuk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=QxBLGBZlps8SbADEn0092WO0/4JC7jdKIbiy1Bam49fWGjmQUqpNtbXs15YKpZhVaA
	O9s01HohNhp5Z4j5kNfyHF4YGy4j027/8b4KggiThoMU5TpN+59u8w864OuCAFakDQPe
	dIlBCX0xppGUwEIv+oA8akNJBDhsqt9bXrvTs=
MIME-Version: 1.0
Received: by 10.216.230.31 with SMTP id i31mr108619weq.7.1304963228704; Mon,
	09 May 2011 10:47:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.195 with HTTP; Mon, 9 May 2011 10:47:08 -0700 (PDT)
In-Reply-To: <4DC81F11.3090401@linux.intel.com>
References: <BANLkTi=EENCHs5vHLhf3L6s2ACRbABFkFw@mail.gmail.com>
	<4DC81F11.3090401@linux.intel.com>
Date: Mon, 9 May 2011 14:47:08 -0300
X-Google-Sender-Auth: lYPo3JUtKsAR_Vi8gJi_07LKMCs
Message-ID: <BANLkTimzP6VDY2iiZLiTCM-JtLGf7pdQdA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Pull request with misc fixes
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
X-List-Received-Date: Mon, 09 May 2011 17:49:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 9, 2011 at 14:06, Saul Wold <sgw@linux.intel.com> wrote:
> I am working on reviewing and staging them. =A0I did not see a patch for =
the
> libxbkfile, did I miss that email?

I will be sending an updated pull request and post the patches with
some fixes. Please wait for it for merging.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



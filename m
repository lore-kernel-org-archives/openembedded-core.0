Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R4DcR-0000Hi-1v
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 17:12:51 +0200
Received: by bke11 with SMTP id 11so2536775bke.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 08:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rf46hedXjDZHIi2UrtcguLdobLg5gxuLMlVfw787CQU=;
	b=AmHnPrDobAYvQngBcDxyr6+4e+VTUGq4Wd+OHFJlNhSC1Qf8mvjPf0r2VE3mSK3lth
	QESEa5rqeNu/V9JaS0QnqjtrW9T3AHfEHFduyK9G5Wz92eCCysJvJo7BORSGgHRvSFLp
	EBc5BuFb+ek6YCuFZ2uMZOe6/EJZ5G+isCS8k=
MIME-Version: 1.0
Received: by 10.204.7.144 with SMTP id d16mr24866bkd.62.1316099259393; Thu, 15
	Sep 2011 08:07:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Thu, 15 Sep 2011 08:07:39 -0700 (PDT)
In-Reply-To: <4E71AFEE.6000502@eukrea.com>
References: <20110911172241.GA3674@chargestorm.se>
	<1315762415-18070-1-git-send-email-eric@eukrea.com>
	<201109121134.42474.paul.eggleton@linux.intel.com>
	<FF2EB738-77F7-4BC5-BB83-82ED8CBC0F96@dominion.thruhere.net>
	<4E70A76E.1030101@eukrea.com>
	<CAP9ODKqgNTF3Uz_kfTfE_=pFrovt-tpmGRGsKBGcXDFy3k-52w@mail.gmail.com>
	<4E71AFEE.6000502@eukrea.com>
Date: Thu, 15 Sep 2011 12:07:39 -0300
X-Google-Sender-Auth: CTEYPD82xmCzrY7ufzvhzjGivYY
Message-ID: <CAP9ODKoPuGXOPNKhxq+bfe-XYDe=ocQT8O7NdNP8ruzbm8BiWA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 15 Sep 2011 15:12:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2011 at 04:57, Eric B=E9nard <eric@eukrea.com> wrote:
> OK we have checked that and it seems they updated the archive on the 12 o=
f
> september without any change in the changelog which explains the md5sum d=
iff
> !
>
> The diff between old and new qt 4.7.4 leads to a 154MB diff which seems t=
o
> concern the documentation and src/corelib/global/qglobal.h wich says :
> -#define QT_PACKAGEDATE_STR "2011-08-23"
> +#define QT_PACKAGEDATE_STR "2011-09-12"

Awesome!

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



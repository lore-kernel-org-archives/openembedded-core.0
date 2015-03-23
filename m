Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0BBA473BD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 15:41:47 +0000 (UTC)
Received: by qgez102 with SMTP id z102so61691962qge.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 08:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8JHfz6b1Ibe7deYyfx2OIqhoeZdt3xWEFtYdBpbb5PU=;
	b=hsVuH13r1dCMMpAdRw0V5XLIgGM05+avDWV3aNsaUgKyODWUt3dZQ+rVYpIsG3cy4F
	9T+BkPIFFvmwfwOT0P8UF00giEw2OGuz/Y83N74L5/ll4RGzwGV0k08kWHAq26Hp7l/x
	DM6piA5AETiyO2nyr3yOuUr3raDVbd2tK4oWWFmb2RoTRhLVjEm8y0re/6K0itqWGcpt
	QKesym1aI4fCijTaOwldAKL1siEJ1N9rD/R/+dewgNo0LMNXHkYGAoj7mnzMzrYiREd9
	Ob6tJxhGE3sAhvCC3t+H9lPZ1IOV5MDcLuVx9edkypPapgPAddX+j+IOpHqF40BKmMVI
	mmLw==
X-Gm-Message-State: ALoCoQljQVPEc2DIv83TA0/vvVtcXz2/qt4E2OZ/oOrjGLrlRXIkJLHfheHF8TRtDVGZybyJUnYH
X-Received: by 10.55.52.83 with SMTP id b80mr128335489qka.36.1427125285415;
	Mon, 23 Mar 2015 08:41:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 23 Mar 2015 08:41:05 -0700 (PDT)
In-Reply-To: <A8967493-D647-4676-8AE0-7819E6CA5602@gmail.com>
References: <1425057596-28243-1-git-send-email-raj.khem@gmail.com>
	<1425057596-28243-3-git-send-email-raj.khem@gmail.com>
	<CAJTo0Lam6E9+75RYCL8bneDVysbPTUdc8iZKN7QEwb3jAK-KFA@mail.gmail.com>
	<A8967493-D647-4676-8AE0-7819E6CA5602@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Mar 2015 17:41:05 +0200
Message-ID: <CAJTo0LYH=Uif+DiouodCnh074n2jcjYSu1xVeWcjGprj6aUHzQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] mtd-utils: update to latest and fix static inlining
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
X-List-Received-Date: Mon, 23 Mar 2015 15:41:49 -0000
Content-Type: multipart/alternative; boundary=001a11490774b0033e0511f67fa6

--001a11490774b0033e0511f67fa6
Content-Type: text/plain; charset=UTF-8

On 23 March 2015 at 17:35, Khem Raj <raj.khem@gmail.com> wrote:

> Please take them from contrib/kraj/master
>

Great, thanks.

Ross

--001a11490774b0033e0511f67fa6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 March 2015 at 17:35, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div>Please take them from contrib/k=
raj/master</div></blockquote></div><br>Great, thanks.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11490774b0033e0511f67fa6--

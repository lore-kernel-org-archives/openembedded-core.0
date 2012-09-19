Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TEEPQ-0007mM-G8
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 09:09:20 +0200
Received: by weyr6 with SMTP id r6so395323wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 23:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=GkyspE8hx7x5Em2OwohCkb1hSz8vH0Kz7siDtDbtFUM=;
	b=tN9qIVL1dqB5LB0pnp8iKFD1tTIOsiV0gQiY2Hobg6HtyIBFuVm/r9+7Qa0+bv1F0L
	8s9zGgabklS5VTEzHs94Xk8wwoNeLmzj0UK6tSPy9UR/EN5uZq4/SIqmPsZFenTKJtj1
	1YEYyrdwdo9xXdaN+paaqR2zqA7OZWucU4LM3h9Na5/3DzBDtNOA8co2BJ3CHKPzN7iF
	S3Fp0ALuV88RfQC5ef3wDLWYyYhM+52T45dQx5zMYogTPqzs1KpGBLElRJqlJO7bF5jh
	GAurl6B1KiLHTfsDPKSGhWi2q5w76FhKm0QnTTjChmD4imQvqjxFkjOBnylL5ILsCL5i
	WsiA==
Received: by 10.216.136.157 with SMTP id w29mr1164514wei.148.1348037799115;
	Tue, 18 Sep 2012 23:56:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.42.197 with HTTP; Tue, 18 Sep 2012 23:56:09 -0700 (PDT)
In-Reply-To: <50595E49.5030202@cisco.com>
References: <1347972747-7040-1-git-send-email-mertsas@cisco.com>
	<50588B69.90209@linux.intel.com> <50595E49.5030202@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Sep 2012 23:56:09 -0700
Message-ID: <CAMKF1spgCREA7=M1PRPnAcyO_iNvda_Ka+3mFThscTOde8U9Nw@mail.gmail.com>
To: =?UTF-8?Q?Martin_Erts=C3=A5s?= <mertsas@cisco.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bash: Make it possible to run bash 3.2.48 instead of 4.2.
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
X-List-Received-Date: Wed, 19 Sep 2012 07:09:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 18, 2012 at 10:55 PM, Martin Erts=C3=A5s <mertsas@cisco.com> wr=
ote:
> Another solution would be to move the LICENSE part out of the inc file,

thats ok.



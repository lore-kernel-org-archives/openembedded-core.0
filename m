Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SZkXz-0005Ax-Fr
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 17:10:51 +0200
Received: by eekd49 with SMTP id d49so1829908eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=KqVE7kHyI6BZ5rjjoAxCSFR5Mek0o5vjspPjHv2vf+o=;
	b=gC1sx9Zvt2k0KqjyN/7pXEwf+bVIAZ5L/mWaZTX2gBPlgY8sW/ZWcLFvrpDpjjE7w3
	XEpIgxJl/2QBXliYNENe8YHZDtTvOKgpKQOrcOoNFAi7SHvtvVT/PLzKouC62sSzR4k0
	O2piQdKi8QXBparZmZZKtCRnNtxHPU12m7XlLHCdyjFtQrj9hKT36iq7Tl6yB2GyQF4T
	lEDM55H1XYhyjnDKJ/7kFnXMxmAIZj/E0Evrttk0ZbTrgicvxYoJt8ZG2VEqcGMKMuis
	YkqwtmGniAfmiaCCq6HShmumVXtCmIvX7suO+nTyd8rCr2hRm41fQHx6Yd7c9WsmP82w
	Ayrg==
Received: by 10.14.95.1 with SMTP id o1mr6313243eef.77.1338390032706; Wed, 30
	May 2012 08:00:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Wed, 30 May 2012 08:00:02 -0700 (PDT)
In-Reply-To: <559834C0-53F2-4E17-8A48-4061CDB0B63B@gmail.com>
References: <E071AE73-05A7-4D16-9442-952E65ECA96C@gmail.com>
	<4FC51727.6020205@windriver.com>
	<2A530553-23DF-4CB1-A957-0E2C3D468BDA@gmail.com>
	<CAMKF1sq_G6k_o+o=OZrhuz2iNq6EEhTYT67dA1cssU3LFS5cYQ@mail.gmail.com>
	<CAAB-1yxXDY4O-JV_gpW8eBmfXU=-Jcp4yc0oqZe1WVr6T-rn_w@mail.gmail.com>
	<559834C0-53F2-4E17-8A48-4061CDB0B63B@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 May 2012 08:00:02 -0700
Message-ID: <CAMKF1sqhA4UMK7xWwpGjF4SOvVBAwGST7uv1nwgu6aa1QCRuKg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-xilinx: ERROR: Failure expanding variable TUNE_PKGARCH ppc440
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
X-List-Received-Date: Wed, 30 May 2012 15:10:51 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 30, 2012 at 7:47 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
>
> What does the -nf suffix do ?
>

indicates no float



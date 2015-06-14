Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id E8443608B6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jun 2015 10:26:08 +0000 (UTC)
Received: by pdbnf5 with SMTP id nf5so52389752pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jun 2015 03:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=N4FqFRTx++9EnZBXYP7aRF4dOhu17A30RWjipGDRCgo=;
	b=UFb8y7zUZ0vsyxR3etgN+aJL8dmJ5FzbDS39U9TlO00PzdHsLh8QmHxRYphYay5uHR
	rh/RLYFXyiuVVkQH7I7dfoa3DyauAmZ1C8nFfadb0NYngVBNzIr/5EjXdn/XfWOLafGa
	HEjlZaKeHxEBILKLHjeizBzQ8hB9Tg/Qw8UwflAevLe1KHd6TIzd1c5GrWHr4DBhQRZN
	6BHI56w6VeeEsQmlaLDrRg3b/f97cp78SozdQGDl4kckKaP0i7cAE8nrk850SQwVedAQ
	RvvNLDn8F6TzP4gI7rPdcaW2vfi/cxymrDhHVPgdCObxBpd5HT+JEn9pNwFh58kfHB+D
	C/Gw==
MIME-Version: 1.0
X-Received: by 10.70.47.9 with SMTP id z9mr38745755pdm.69.1434277569762; Sun,
	14 Jun 2015 03:26:09 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Sun, 14 Jun 2015 03:26:09 -0700 (PDT)
In-Reply-To: <1434229118-31859-1-git-send-email-costin.c.constantin@intel.com>
References: <1434229118-31859-1-git-send-email-costin.c.constantin@intel.com>
Date: Sun, 14 Jun 2015 12:26:09 +0200
Message-ID: <CALbNGRTirxOBPjdpbvrWe6KBsJNJLJEMeJ2yiFCD=+nDWpQnfA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Costin Constantin <costin.c.constantin@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scripts/oe-selftest: enhancement 7865
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
X-List-Received-Date: Sun, 14 Jun 2015 10:26:11 -0000
Content-Type: text/plain; charset=UTF-8

A bit more love for commit message please

Andreas


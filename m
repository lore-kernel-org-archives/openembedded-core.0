Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UDH5j-0004Bj-UI
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 17:21:28 +0100
Received: by mail-wg0-f45.google.com with SMTP id dq12so7895676wgb.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2013 08:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=Z05IetWKRVcdKLhT12Ftn3y4QW8h90PKVa3M+CpwoSE=;
	b=ku16DXK3I2rNuZZehhQDixVIW88r8z7wwO3+mGd0R0+XQvWCI4Nzr/EKnqwxO2l2YZ
	KXWIGuufl0cNS3i5IGHdh/ZrlbKy44vQH8+h9ySc/Md7kvJqjVWGhwCGfu9J7TcAoB9F
	sFmi7oieFg2UsYQjKW/mM1XVrQwphTl138vUw53KAM/WxNbEMN7OA02PZ0rhcEuW9RCa
	LNYgex7OKe55wtGrmPyWZDFdExdrBa6tDc/ho+o/eGaw7MigG+9ehpl0nKZ+b3lRI0ET
	i/wv8OmKL1OIg+ewfMoBaGMzX9jCvM7u/aLGCDGVx04kHsFa/IYc8x6xk1gqmOafbpaY
	Xt1w==
MIME-Version: 1.0
X-Received: by 10.194.21.233 with SMTP id y9mr41346949wje.47.1362585888884;
	Wed, 06 Mar 2013 08:04:48 -0800 (PST)
Received: by 10.194.45.100 with HTTP; Wed, 6 Mar 2013 08:04:48 -0800 (PST)
In-Reply-To: <CAMKF1spo15CEJUyq2sf9cHA=VMgdhOHVgeHGQ3EAsJzcY9q-9g@mail.gmail.com>
References: <1362360870-12148-1-git-send-email-randy.macleod@windriver.com>
	<20130304081846.GC3268@jama> <1362391887.29587.5.camel@ted>
	<CAMKF1spo15CEJUyq2sf9cHA=VMgdhOHVgeHGQ3EAsJzcY9q-9g@mail.gmail.com>
Date: Wed, 6 Mar 2013 11:04:48 -0500
Message-ID: <CAHUNapRRwtjCtfcAixq+vSt250Ep-jGPbeqv17SgRLRce-4r0g@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] apr: add libtool to SSTATE_SCAN_FILES
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
X-List-Received-Date: Wed, 06 Mar 2013 16:21:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ah... so CQID is an internal WindRiver thing?



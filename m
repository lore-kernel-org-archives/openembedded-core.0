Return-Path: <kirgene@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id E0A9561FE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 10:46:27 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id e89so10738798qgf.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 03:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=5wRdFwioCN9gX/op4iVWHCpUJ/jAvIl1WC56qVDUNA8=;
	b=kHymBjsvUMw14Y3x9MXKKk3ERVY5YEYSyj9u60jBaxonUN4AFlBq343ZCsi+UaihiD
	l9RxspkkwVu9Xck2NMQw6Q7GmHSRNuGrRyVGdGKUoBEAS0ei9JYKaENOwWjolZ1Ymfg0
	jFbzD56bQRuNZu/XM4tOlBkjNeZinGHos6kQ3+FD/310HlgaPxEBtWQapsFlZsd4oyTm
	dduNnsZC9mWTCvn7Zx/t+J72JZeqA1CKhVbL5HPIsKfW9Xyshlgzn0f9XN7nDj6a+8nr
	Q8p7U6ziwR9HLlaGgg/k3KkdI92BveFza1uItSphYCI6n8bdb2G8AS3uS+deASlB+xot
	gonw==
MIME-Version: 1.0
X-Received: by 10.224.112.1 with SMTP id u1mr5262522qap.7.1407926788337; Wed,
	13 Aug 2014 03:46:28 -0700 (PDT)
Received: by 10.140.51.103 with HTTP; Wed, 13 Aug 2014 03:46:28 -0700 (PDT)
Received: by 10.140.51.103 with HTTP; Wed, 13 Aug 2014 03:46:28 -0700 (PDT)
In-Reply-To: <CADV-EXHPuDtDk8pnFfJ4QQCVQufidX+7YuuK_FdgsEXj_46t6A@mail.gmail.com>
References: <CADV-EXHPuDtDk8pnFfJ4QQCVQufidX+7YuuK_FdgsEXj_46t6A@mail.gmail.com>
Date: Wed, 13 Aug 2014 13:46:28 +0300
Message-ID: <CADV-EXHDKqVR8Quu=Vj7-Tk8BrB-OS1Y=Y0iYi+ES2YNUiREMQ@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Two distros with same MACHINE
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
X-List-Received-Date: Wed, 13 Aug 2014 10:46:32 -0000
Content-Type: multipart/alternative; boundary=047d7b673a4e16b99305008080ca

--047d7b673a4e16b99305008080ca
Content-Type: text/plain; charset=ISO-8859-1

I have 2 distro configs that use different PACKAGECONFIG settings for the
same package. I'm building all distros for single MACHINE. Do I need to set
different TMPDIR to build these two distros or I can use same dir?

--047d7b673a4e16b99305008080ca
Content-Type: text/html; charset=ISO-8859-1

<p dir="ltr">I have 2 distro configs that use different PACKAGECONFIG settings for the same package. I&#39;m building all distros for single MACHINE. Do I need to set different TMPDIR to build these two distros or I can use same dir?</p>


--047d7b673a4e16b99305008080ca--

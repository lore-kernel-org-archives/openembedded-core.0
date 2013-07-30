Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9313D6B282
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 21:04:22 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i10so12014985oag.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 14:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=Tp2zRfP1plEJWvdxP6F2hXEcyN1MyNRHmLQ//k4t4T4=;
	b=gGDt9nZwnw16tSyti//ykSuFRriDzY3wUg1L5+hXhBKwMJGDgtZHwPsZV1MIdbCLZZ
	xmf6nQoLmbeYD7CRTLudehthiHA0W4F0I9KBIFhpV3E/7MdjU89QctObdrvuesYW4yIh
	8nIyQ10G34B1/asUOPT0vZllaZTYty+5JarDV8NpiKLSVgyLCeuwkYF5DkNsWTxNZd5t
	QiXf9p1xfTeXKmJC+Dd//jte7Ff18mHMbLgGeD21k0w+Z9V91r4peFa6oO2Z3XiIauZj
	B28kFPvtQpXX39ct9xnp56n0lswMmFxmgco/H25jjmknMhEZmuRdQmipk0hFBcOyLa+Q
	15dw==
MIME-Version: 1.0
X-Received: by 10.60.97.74 with SMTP id dy10mr63421142oeb.27.1375218263164;
	Tue, 30 Jul 2013 14:04:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.125.199 with HTTP; Tue, 30 Jul 2013 14:04:23 -0700 (PDT)
In-Reply-To: <1375218067-27778-1-git-send-email-eric.nelson@boundarydevices.com>
References: <1375218067-27778-1-git-send-email-eric.nelson@boundarydevices.com>
Date: Tue, 30 Jul 2013 18:04:23 -0300
X-Google-Sender-Auth: sRkHV-aMuIW6plpaJtoSAcafEs8
Message-ID: <CAP9ODKqSr8zgjztW2VFdKg+Cw0oGOCuFAQVQ2TGn7SgHYWjfQw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Eric Nelson <eric.nelson@boundarydevices.com>
Cc: "Eggleton, Paul" <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-plugins-gl: add explicit dependency on libpng
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
X-List-Received-Date: Tue, 30 Jul 2013 21:04:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 30, 2013 at 6:01 PM, Eric Nelson
<eric.nelson@boundarydevices.com> wrote:
> Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Paul, can you queue this for dylan next update?

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


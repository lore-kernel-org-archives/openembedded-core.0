Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9BC317831F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 07:05:36 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id q124so7947601wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 00:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=C3sc2gQEoaevsC454dzuHty0ODw9DSF5gyb2eFPTgdo=;
	b=j18+HzMCDDgwc6FGVDHYXap0uoX/wsU8K/7FF4We/c+kekvqncxQTVvBegPxJPftmE
	cKuPYMqtQiELuGmjBlI4HNS8fGMufiLQ7gYpTR+rerMyauxzmWRGjZBoZfzzqnxGdrpr
	9/8ptZcPcKDibUjlD85iT8WivoQlKiBIt7G5/AiGoo94wh+5ZoL2j03+kDiLd40f78h/
	2T9vREgxJHOdOPWQ1eFLku/duyiUnDb3B8fsIQKv+FrROCLZ6VHJLYgIvEA7qZahwhVa
	YoLEyH4R0TdwjGlEledPha6GYC4kNRzEZs3pnrd1spIIlkcGc8R0aNYHrF+fEFTZIjnc
	AxZQ==
X-Gm-Message-State: AMCzsaU7Mb70kBd1IVQvjL4nhNTxajutwCaY5QSvDKXqow5iSkmCJ4CD
	MggSu45weQ552nDkfLIB/fpOV4h2
X-Google-Smtp-Source: AOwi7QDhgndukdTf/PY3qO1rzhBfh9NnETOS6ajhoJxfT55+rUzlq3SXrnfRI1gl2pN7qdOdkVTKAQ==
X-Received: by 10.80.242.149 with SMTP id f21mr20881219edm.6.1508310337185;
	Wed, 18 Oct 2017 00:05:37 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d49sm8220067edb.79.2017.10.18.00.05.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 Oct 2017 00:05:36 -0700 (PDT)
Message-ID: <1508310335.20275.9.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Oct 2017 08:05:35 +0100
In-Reply-To: <2518c75b-b1b1-cd16-213b-94cea6f3abee@gmail.com>
References: <20171006121259.5817-1-git@andred.net>
	<2518c75b-b1b1-cd16-213b-94cea6f3abee@gmail.com>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Subject: Re: [pyro] some backported patches
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
X-List-Received-Date: Wed, 18 Oct 2017 07:05:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Armin,

On Tue, 2017-10-10 at 07:58 -0700, akuster808 wrote:
> Andre
> 
> 
> On 10/06/2017 05:12 AM, André Draszik wrote:
> > Hi,
> > 
> > Can these fixes/patches from master please be applied to pyro.
> 
> I have integrated this series into my stagging. I ran into a build
> issue. I need to sort out if this came in with this set of other
> backports I have pending.

Thanks. Do you need any help?

Cheers,
Andre'



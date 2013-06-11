Return-Path: <ross.burton@intel.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 80E996A9A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 15:53:56 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro2so8643345pbb.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=1iRqzmM4QDtsMM+dzQurBH4hRmeO3lqcLDMveo3bqCo=;
	b=gbqGsAgyGz+ZpBsY4dpptrBFCnxtBp+QZCdMpgDAN8fnT5NXvAD/xnEYGVkK1N+QUq
	Mz94v2D6Iz3WiwPkTYn3BUw6FC4T0tBQEYtn2Wquf4fcLF0Hs8UmDaDNiCZ2UrXco7TU
	rcSFFIP63C0fzmHqG2rJltrKrVGZ+iJJTZ8KxL5uAZQA54DxfJZQZ8iRDPdkSiazrST0
	VZmlK5GE/oVj25n0RWCW1bNCtYKHNrOTkty43K3uABsDmcm6WPpk7D2O9FVVuCsbao98
	b9NjV88++093SWRTh7EIIP1nPHJRsYC281WGvbjWZhMWpOAY36hU4H5oSX1DNPsQFgL5
	w/vA==
X-Received: by 10.66.160.101 with SMTP id xj5mr19479492pab.5.1370966037556;
	Tue, 11 Jun 2013 08:53:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Tue, 11 Jun 2013 08:53:37 -0700 (PDT)
In-Reply-To: <1370426553-23428-1-git-send-email-Martin.Jansa@gmail.com>
References: <1370426553-23428-1-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jun 2013 16:53:37 +0100
Message-ID: <CAJTo0LY2gBhpNMEtr+VtawCcw8J5VetQdU=FyFM4dfrtYR_ipw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmI468EFKweVTLv7YfKcBCGE9DE3hNdAXvjTbAaNX32z0HpXJQV7htuuWHEl91Dnu5XI9Z8
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] site: add alignment values for at-spi2-core
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
X-List-Received-Date: Tue, 11 Jun 2013 15:53:57 -0000
Content-Type: text/plain; charset=UTF-8

On 5 June 2013 11:02, Martin Jansa <martin.jansa@gmail.com> wrote:
> * x86 and x86_64 values were added in
>   8c46ec2edc0197b32d32e0f27d5b60271338b600
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>

Anyone got PPC or MIPS hardware to hand?

Ross


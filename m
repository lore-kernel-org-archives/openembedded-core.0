Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 17E5571434
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 10:48:48 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id dc16so5248753qab.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Sep 2014 03:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0rLRnDXIFSD3uHer0pXt0I4USimMdy1Mqsnre9pidhw=;
	b=RTKm1zYzjmRC4rKOJowHG+jba7grbgYX3agzkQel/EAxpeVthbsZtr5BpJT/r2EAjf
	qlHvvkVvnIOOGmX6enS3hiA2FSr1h7PbdfHJS9MJhLFsujBEn7XpLSCi+Rh7Z1BRjbvb
	7lhVDMx0gIp4+MnsF8mUudfYFaynACWDPtzDoUf5XLdx7Xj1nXXxOWDeNr8ZasucOc+5
	6JZsNvn4NYDks4Ru4Sgrb83yQ2Z2cakuwDxiS5i3NU26rINQ99lodj8ASrpBBhk86UBT
	unJa6Qyd5sb1LQW9BFZw+R7FdLhltgI8va6pMkIWT1GquaoIiYjMGjoi4W83fcv3ah/e
	or3w==
X-Gm-Message-State: ALoCoQk8kxWATDEdeyEEQMt7/CesDnOOmnm1FgbkoTWR17COyTfi0Qw/H90BlQ7KaQb0kW/TONuT
X-Received: by 10.140.27.173 with SMTP id 42mr5207577qgx.59.1409827729696;
	Thu, 04 Sep 2014 03:48:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 4 Sep 2014 03:48:29 -0700 (PDT)
In-Reply-To: <d323bbf79127a7216a0970375369a0ae773b89c7.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
	<d323bbf79127a7216a0970375369a0ae773b89c7.1409764769.git.chris_larson@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Sep 2014 11:48:29 +0100
Message-ID: <CAJTo0LYvHpfJCO5XRHS=JE0-WaDGi=2sEToPsxD2rTwf9WszZQ@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] hostap-utils: obey LDFLAGS
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
X-List-Received-Date: Thu, 04 Sep 2014 10:48:49 -0000
Content-Type: text/plain; charset=UTF-8

On 3 September 2014 18:27, Christopher Larson <kergoth@gmail.com> wrote:
> +++ b/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch

Missing header.

Ross


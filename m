Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id BA5C473BBE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 04:53:13 +0000 (UTC)
Received: by iesa3 with SMTP id a3so28602678ies.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 21:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=SSxQaC+avw+SzzzB3RX4K8zi5CdmmxIScx/mJS2AIvE=;
	b=D/cIRO3cXLSVk0lWotNwvpkpztTCM6A+P+SP+mBDRZv2gjn+Zj5D/bpe6c38Vhmy35
	ZLPOffUconO+AJgIJwHrFspZaDKwtnmC9ejX0vNCkMiUerQNbZke+G+Ls07BA5RAvK3t
	DJkcxHufHld5R7raLiiHA2Enco8jDlcnt4IRpsUcd4vG6ACl/TQVHWbWqAcK32+H0jHl
	AWkujBywmAdQDa0ZVZM50UwjsM+mHgEm03f0MFv7IeiDf0prwIE7MUZRVuv4sfmE4ifv
	MGczeEtRk5klTUXYXx1M5i9pNLrefmUHx5S0/2Wbfkqy+Y5dWtTzZxNu7QLwAv1fJ5Jh
	9h0A==
X-Received: by 10.43.17.135 with SMTP id qc7mr2321635icb.14.1433393594938;
	Wed, 03 Jun 2015 21:53:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.166 with HTTP; Wed, 3 Jun 2015 21:52:44 -0700 (PDT)
In-Reply-To: <1433330298.2898.0.camel@tkkaskin-mobl3.ger.corp.intel.com>
References: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
	<e5260dbf168f3c51d9114e4c4cb1fca49abc83b1.1432320274.git.tanu.kaskinen@linux.intel.com>
	<1432448758.12832.67.camel@linuxfoundation.org>
	<3ABA6702-FFD6-448B-99B2-5DD5723A3AD3@gmail.com>
	<CAMKF1sqm97zeLZ5v70-BKW=+tPCn+w_bDibFkM2q6714kpABJg@mail.gmail.com>
	<1433330298.2898.0.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Jun 2015 21:52:44 -0700
Message-ID: <CAMKF1sr+=ebq-FQbSpPZNyr0yBc4m=uZBib1QGuv0abvejQn8w@mail.gmail.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/5] alsa-plugins: initial recipe
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
X-List-Received-Date: Thu, 04 Jun 2015 04:53:17 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 3, 2015 at 4:18 AM, Tanu Kaskinen
<tanu.kaskinen@linux.intel.com> wrote:
> I now sent a fix for these warnings.

thanks


Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD526F7CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 10:10:14 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id m20so803351qcx.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 03:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AyuFfG1J4yJGphPgP5Vpb9ZkPgmbLwatzkgsXlDvEwE=;
	b=DMnR7TZn8f0UZzdVyo6AalyOfdHRxS1qoI7MRLkidfW8eBs+Y4eTLIeLp8fv1ldnK8
	zGeUY4mcwmfv7vY354MkL866Mp1RpxzZPzRLnaHxWSlmKvUSyRVpIrjaUMB/Sy4tg4Kq
	ihKEEmMNZIOw9jLjdhQAe6MuliwkppJ5cguj0gIyW7XQ7KWQz/L1zKKulPm5RXcnzVLa
	Ak6fyqVhsShAzDCnWVLT1zEOz5EszKn84yeg2gP8q+GHfQZN5m6SBMPHQxgq1Ug4QKDm
	8rJcpd4ocRVOUx/nXDrt3+mhrFQI3q0HQLEoyxzkKp+h8+gPidju4+82SAkD9t45y9hJ
	woTg==
X-Gm-Message-State: ALoCoQmurosQwKgMCdoGOXRT1AGOCrB2cQwv+uddSntCLeR/iTJmyVD1CGD6qgBmzxn9m6Gq0MAI
X-Received: by 10.229.12.197 with SMTP id y5mr1169079qcy.22.1394705415147;
	Thu, 13 Mar 2014 03:10:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Thu, 13 Mar 2014 03:09:55 -0700 (PDT)
In-Reply-To: <fcd2f5c2d7d8063a6084de454c0847cba830480d.1394703743.git.cristian.iorga@intel.com>
References: <cover.1394703743.git.cristian.iorga@intel.com>
	<fcd2f5c2d7d8063a6084de454c0847cba830480d.1394703743.git.cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Mar 2014 10:09:55 +0000
Message-ID: <CAJTo0Lb2GW2LPQBeWJ45tBwnMTwAYrt9u9edi1nDb6vogLYkgQ@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] packagegroup-core-tools-testapp: added 3G tools
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
X-List-Received-Date: Thu, 13 Mar 2014 10:10:19 -0000
Content-Type: text/plain; charset=UTF-8

On 13 March 2014 09:45, Cristian Iorga <cristian.iorga@intel.com> wrote:
> -PR = "r2"
> +PR = "r3"

No need to bump PR.

Ross


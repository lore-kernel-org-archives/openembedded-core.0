Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 18BB07142B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 10:39:58 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id r5so10482584qcx.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Sep 2014 03:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xC1s8mJ+ZfXvQsnd9/V1pws7aC1q0IYXzCIqjBFlN2g=;
	b=LvocjCw+g+47Su1Vzuuec4H6nEUwFxefSDBeCRxaj8UdCwKB4uHuDgP+xWFkoaV5QK
	sPf9+uToxyIeWAJQ9pc3sy4xrxuzMSaa01P+iLwnMnRPfaMv+DsH4LIixhrRSMzL1w+d
	s2l9JbBYBcmfHpYP0vKw0kL8Lbxz/4MI4AWryu2X/U/i9pbIbFG3iC8gk9sOQ4J0WpNE
	wDsujVkWvuDbSygs4TtBQYC5sH889l2+awyxRs4dLE5DGCjMJXbUhsi1hmicrbjvsSW3
	pFKT2+QrU9h+0+GfkPM3C1EElhRpFBRC9BeQQKaeeLF2PID6hTBZAqrKYpk65Q7CfChH
	hUFA==
X-Gm-Message-State: ALoCoQmq0Nssawx5/bQ27m5S2U+Juh7giCcPva+eQ3rNHF5bRmwMyBtFseDZxAP4rN00rqO4Edq8
X-Received: by 10.224.79.139 with SMTP id p11mr5263818qak.93.1409827199770;
	Thu, 04 Sep 2014 03:39:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 4 Sep 2014 03:39:39 -0700 (PDT)
In-Reply-To: <565e0b437831bac67747dfa93478fcf93e80dadd.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
	<565e0b437831bac67747dfa93478fcf93e80dadd.1409764769.git.chris_larson@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Sep 2014 11:39:39 +0100
Message-ID: <CAJTo0LYt1xUt6Xn5Scrf+Wm-1rTdub5Z_nkSH84pG4mF6rriOg@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] ossp-uuid: obey LDFLAGS
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
X-List-Received-Date: Thu, 04 Sep 2014 10:40:06 -0000
Content-Type: text/plain; charset=UTF-8

On 3 September 2014 18:27, Christopher Larson <kergoth@gmail.com> wrote:
> +++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch

Missing patch header.

Ross


Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 75BA2600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 20:28:55 +0000 (UTC)
Received: by wgfl8 with SMTP id l8so64843747wgf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 13:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xeJG+FkM3TNUiN47+nHffqhNM9qP7BBFDIvsBSJoblw=;
	b=P3t6bG6U/CzkgiCfLiGPGYe7sLYkzxVRXwFSp5dI98VpMgFqrTKovlixcq8MtlZQ0s
	lNKbe7M1Xdl0jqJubCJRg7bGmU9Xgt+fGYpaUUYB521cirDdTi1DQuZ4wuy6vWS/woIH
	VzrTN46Bjk4i3hf0R8Vjv7+8IF9zTNF+fAACN4aSuK+ggQ8MXJWf7/ntEpuZjG5KXluX
	tfUUXaeul4+T4PTnP5fvKLGM6sMoJmwszZbz6q/P1fdHguh1CdaEHWNb0AwNS1+YzwwU
	VsogkF1ZWAgQXcZGs4GFK3mzJE2I+EY6r/1t17aSr23K8WzDR0PzqIjLxCVPTSkjmX28
	1X/Q==
X-Gm-Message-State: ALoCoQnqPmBMRxAJkTESsNko6p7LtEAg99OWphASX66cvgMoLz5dPE1CikscPGTjb+HLIK4MMUsp
X-Received: by 10.194.122.105 with SMTP id lr9mr69198588wjb.153.1432153736442; 
	Wed, 20 May 2015 13:28:56 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id b10sm5208846wiz.9.2015.05.20.13.28.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 May 2015 13:28:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2015 21:24:35 +0100
Message-Id: <1432153478-5784-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/4] puzzles: upgrade to latest srcrev
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
X-List-Received-Date: Wed, 20 May 2015 20:28:56 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/puzzles/{puzzles_r10116.bb => puzzles_r10286.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-sato/puzzles/{puzzles_r10116.bb => puzzles_r10286.bb} (100%)

diff --git a/meta/recipes-sato/puzzles/puzzles_r10116.bb b/meta/recipes-sato/puzzles/puzzles_r10286.bb
similarity index 100%
rename from meta/recipes-sato/puzzles/puzzles_r10116.bb
rename to meta/recipes-sato/puzzles/puzzles_r10286.bb
-- 
2.1.4



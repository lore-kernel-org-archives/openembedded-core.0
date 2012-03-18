Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9BVi-0006qG-Sh
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Mar 2012 09:30:42 +0100
Received: by wera1 with SMTP id a1so5106050wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Mar 2012 01:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=zBi8fk5osvZvfgpvqF99BMjzWYgSZcapaDjkkz0/RXU=;
	b=EMSiQ7Wo18O24A6EqV0h2dUNU80FDjvv8lxUvOkCXw3FgNf6AGf/6bCaQPAU955D2h
	1KicchG0fy13rgj4gfMnEWRkCd3lZn+h4Gx9yChDQh08hzCUwnebqRupb1W/JTzuiINX
	I1GXnffjssgFZ5rBDfUGJ2z2Eg18Rqfn36WCTirOYSs8a5dLOtg49uzd+hR0PbNqIxnC
	gedm3BDHEqYi59TdLSL+Ad9ne4IGGIn+fM6KDoF7FvEj1pnCVOhn+RDCEqOJhPhg/7CQ
	YwE3ZQH/0CFvKGvBYIYYOfgf2T9Lmv1yDsU1cI7U8uBkjCt5rf9Nzw5AgEM1uWVF0Cej
	ebHg==
Received: by 10.180.85.70 with SMTP id f6mr11168004wiz.5.1332058913251;
	Sun, 18 Mar 2012 01:21:53 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff9sm14627209wib.2.2012.03.18.01.21.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Mar 2012 01:21:51 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <401c27ba4e7f8b5bc0da084cd48d1738157c894b.1332049148.git.dexuan.cui@intel.com>
Date: Sun, 18 Mar 2012 09:21:49 +0100
Message-Id: <84AFADF8-9F03-46C2-80EE-F9CDEE8991CF@dominion.thruhere.net>
References: <cover.1332049148.git.dexuan.cui@intel.com>
	<401c27ba4e7f8b5bc0da084cd48d1738157c894b.1332049148.git.dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmiM61OcJn57RsCMe9aUFam/Y42uHLZQuIORPBTEuxN7od8NLUwBBwsjtm0OuNvx/ZcdCyH
Subject: Re: [PATCH 1/1] self-hosted-image: pre-populate the builder user with poky source
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 18 Mar 2012 08:30:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 18 mrt. 2012, om 06:41 heeft Dexuan Cui het volgende geschreven:

> [YOCTO #2065]

What does that mean?




Received: from mail-qe0-f49.google.com ([209.85.128.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UH60n-0004OF-0b
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Mar 2013 06:20:01 +0100
Received: by mail-qe0-f49.google.com with SMTP id 1so2697906qec.22
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Mar 2013 22:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=Uut/6mMHwCMFq7Mx7//C0We76Auh5gLPNAHpsvxk6KM=;
	b=wtwOoSQeQx1CTOsaNmrhbP/U6qT1UMY6iIpRvly8oz4flOvHwAUTFH0xQzgbk00N7S
	nDAQpiSrFVNd7Hc9s4JeV8HSVQR6sCCw3aVjFv5eiL6NmbZuufxRa2c5YnCPfZgRZNJ/
	SyyTGqvFKNUFzmic/JSkb2m6wuvgvtvMm9YP89z7rRQBSgiCz25K8ra4j0JqBEbtCSSD
	HTcM/VmircaIXg7Iq1r8MMHZ7FqXlBGeKSuv3Y7HbPlBQGMxUgCwf6UeaglIgmUNWcqX
	p+UXGQOLhmwD2SzPZAWei11T+Ergazshr/6IHnREO32pSU3sIdajpNm4UrxlQahle4o9
	izmg==
X-Received: by 10.224.19.20 with SMTP id y20mr13928117qaa.14.1363496590834;
	Sat, 16 Mar 2013 22:03:10 -0700 (PDT)
Received: from [172.23.7.5] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id t3sm18853964qen.5.2013.03.16.22.03.09
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 16 Mar 2013 22:03:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1363377280-14797-1-git-send-email-sgw@linux.intel.com>
Date: Sat, 16 Mar 2013 22:03:09 -0700
Message-Id: <FC0195A5-8F7D-4750-95F6-53CEACBDEB31@gmail.com>
References: <1363377280-14797-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Update License Information (remove GPLv3 Licnese)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Mar 2013 05:20:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Mar 15, 2013, at 12:54 PM, Saul Wold <sgw@linux.intel.com> wrote:

> The upstream authors have updated the licenses of a couple subcomponents,
> these were GPLv3, but updated to be either GPLv2 or LGPLv2.1 accordingly.
> These changes make the util-linux package become completely non-GPLv3.

Is it possible to demote license from V3 to V2 like that  I wonder



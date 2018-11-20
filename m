Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 282316C48F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 15:44:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2018 07:44:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,257,1539673200"; d="scan'208";a="109704113"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.31.112])
	by fmsmga001.fm.intel.com with ESMTP; 20 Nov 2018 07:44:04 -0800
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: OE-core <openembedded-core@lists.openembedded.org>
In-Reply-To: <46DEAC02-3743-4A88-A5EA-52C671A19E1A@linux.intel.com> (Tim
	Orling's message of "Fri, 16 Nov 2018 13:45:28 -0800")
Organization: Intel Corporation
References: <46DEAC02-3743-4A88-A5EA-52C671A19E1A@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Tue, 20 Nov 2018 16:44:03 +0100
Message-ID: <87ftvv69fg.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [sumo] cherry-pick request to fix bison on glibc 2.28
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
X-List-Received-Date: Tue, 20 Nov 2018 15:44:04 -0000
Content-Type: text/plain

Tim Orling <timothy.t.orling@linux.intel.com> writes:

> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=5e441f3f8aa896e264f44ba8b699e5841cceade4
>
> or
>
> http://git.openembedded.org/openembedded-core/commit/?id=741415c58b3565764000028c26efd081212eb989l

+Armin

I was going to send a patch with the backport but noticed this email.
Would you still prefer a patch anyway?


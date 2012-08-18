Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T2haB-00060s-3u
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 13:52:47 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Aug 2012 04:40:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,790,1336374000"; d="scan'208";a="188080090"
Received: from unknown (HELO helios.localnet) ([10.252.121.96])
	by orsmga002.jf.intel.com with ESMTP; 18 Aug 2012 04:40:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Aug 2012 12:40:43 +0100
Message-ID: <2197081.DenY8jTjx9@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1345265802-16783-2-git-send-email-raj.khem@gmail.com>
References: <1345265802-16783-1-git-send-email-raj.khem@gmail.com>
	<1345265802-16783-2-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] unifdef-native: Correct LICENSE
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
X-List-Received-Date: Sat, 18 Aug 2012 11:52:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 17 August 2012 21:56:42 Khem Raj wrote:
> The header in sourcefile says its BSD licensed
> not GPL therefore make the correction

Could we be more specific there and say LICENSE = "BSD-2-Clause" ?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



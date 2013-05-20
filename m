Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 916CA6148A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 21:52:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 May 2013 14:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,709,1363158000"; d="scan'208";a="340460856"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by orsmga002.jf.intel.com with ESMTP; 20 May 2013 14:52:26 -0700
Message-ID: <519A9B1A.2050505@linux.intel.com>
Date: Mon, 20 May 2013 14:52:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: GCC-4.8 and Arm Kernel
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
X-List-Received-Date: Mon, 20 May 2013 21:52:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Folks,

We want to move forward to the GCC-4.8 Compiler, what's holding us back 
right now is a kernel update for ARM.  My understanding is there is a 
patch out there, but it needs to be backported and tested. I have 
checked with Bruce A. about this and he has limited availability, but 
will take a patch to the kernel tree if a well tested patch is provide.

Thanks

-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System



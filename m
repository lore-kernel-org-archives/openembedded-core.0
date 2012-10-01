Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TIpXT-0000kT-5m
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 01:36:39 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Oct 2012 16:23:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,520,1344236400"; d="scan'208";a="217864333"
Received: from unknown (HELO envy.home) ([10.255.13.216])
	by orsmga002.jf.intel.com with ESMTP; 01 Oct 2012 16:23:36 -0700
Message-ID: <506A25CA.2080907@linux.intel.com>
Date: Mon, 01 Oct 2012 16:22:50 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1349133467.git.dvhart@linux.intel.com>
	<67b76bba8d5cc8fd17567d7b2c0465ae93fdd704.1349133467.git.dvhart@linux.intel.com>
In-Reply-To: <67b76bba8d5cc8fd17567d7b2c0465ae93fdd704.1349133467.git.dvhart@linux.intel.com>
X-Enigmail-Version: 1.4.4
Cc: Scott Garman <scott.a.garman@intel.com>,
	John Howard <john.howard@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] gnutls: Update SRC_URI to use GNU_MIRROR
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
X-List-Received-Date: Mon, 01 Oct 2012 23:36:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 10/01/2012 04:19 PM, Darren Hart wrote:
> The current SRC_URI fails. Update it with the GNU_MIRROR SRC_URI from
> upstream commit 188dff3daf048e369bcab0d1db2964490e43d734.

Sorry, that was the poky commit. Updated in the branch to the oe-core
commit:

753b22012f10c393c191d3116b9d38ee4be6d112

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel



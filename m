Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7778260FE4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2013 01:02:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Dec 2013 16:58:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,524,1384329600"; d="scan'208";a="455763866"
Received: from unknown (HELO helios.localnet) ([10.252.122.119])
	by orsmga002.jf.intel.com with ESMTP; 20 Dec 2013 17:01:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Sat, 21 Dec 2013 01:01:50 +0000
Message-ID: <11192874.rs9VKmuIPZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1387565248-18457-3-git-send-email-sgw@linux.intel.com>
References: <1387565248-18457-1-git-send-email-sgw@linux.intel.com>
	<1387565248-18457-3-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] sqlite: remove unrecognised options: --enable-tempstore
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
X-List-Received-Date: Sat, 21 Dec 2013 01:02:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Saul,

On Friday 20 December 2013 10:47:27 Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---

IMO we need more details for these option removal commits; we need to know 
when the option disappeared if it did in fact disappear (as opposed to having 
been wrong in the first place or renamed to something else).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


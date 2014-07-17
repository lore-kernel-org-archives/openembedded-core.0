Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 80CAE70686
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:29:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Jul 2014 07:23:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,678,1400050800"; d="scan'208";a="544806501"
Received: from ldsaruwe-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.2])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2014 07:28:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ross Burton <ross.burton@intel.com>
Date: Thu, 17 Jul 2014 15:28:16 +0100
Message-ID: <5307977.FlueH2KIor@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.2 (Linux/3.15.4-200.fc20.x86_64; KDE/4.13.2; x86_64; ; )
In-Reply-To: <630fae1a4789305e375dc7897b9bbb71a240e250.1405542583.git.ross.burton@intel.com>
References: <cover.1405542583.git.ross.burton@intel.com>
	<630fae1a4789305e375dc7897b9bbb71a240e250.1405542583.git.ross.burton@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] license.bbclass: canonicalise licenses when dealing with INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Thu, 17 Jul 2014 14:29:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 16 July 2014 22:08:13 Ross Burton wrote:
> If INCOMPATIBLE_LICENSE=GPLv3.0 but the recipe sets LICENSE=GPLv3, the

Pedantic, but INCOMPATIBLE_LICENSE = "GPL-3.0" surely?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


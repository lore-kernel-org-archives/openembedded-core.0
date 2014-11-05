Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E866F65CA0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 12:28:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 05 Nov 2014 04:26:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,319,1413270000"; d="scan'208";a="631873676"
Received: from sergeypo-mobl1.ccr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.106])
	by orsmga002.jf.intel.com with ESMTP; 05 Nov 2014 04:28:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Date: Wed, 05 Nov 2014 12:28:57 +0000
Message-ID: <5425666.uucE3BEg2m@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.2 (Linux/3.16.7-200.fc20.x86_64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <1415190193-40532-1-git-send-email-sona.sarmadi@enea.com>
References: <1415190193-40532-1-git-send-email-sona.sarmadi@enea.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: Fix for CVE-2014-3566
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
X-List-Received-Date: Wed, 05 Nov 2014 12:29:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Sona,

On Wednesday 05 November 2014 13:23:13 Sona Sarmadi wrote:
> OpenSSL_1.0.1 SSLV3 POODLE VULNERABILITY (CVE-2014-3566)
> 
> This patch is a backport from OpenSSL_1.0.1j.
> 
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>

Just to be clear, this is for the dora branch right?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6ADEB7E950
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 03:00:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jul 2019 20:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,492,1557212400"; d="scan'208";a="318551735"
Received: from lduttal-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.187.17])
	by orsmga004.jf.intel.com with ESMTP; 14 Jul 2019 20:00:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Date: Mon, 15 Jul 2019 15:00:20 +1200
Message-ID: <6626896.5blaEgOQa4@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <1562783254-14818-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1562783254-14818-1-git-send-email-chandana.kalluri@xilinx.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][PATCH v5 0/3] Devtool: provide easy means of reconfiguring
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
X-List-Received-Date: Mon, 15 Jul 2019 03:00:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chandana

On Thursday, 11 July 2019 6:27:31 AM NZST Sai Hari Chandana Kalluri wrote:
> changelog v5
> 1. test against devtool oe-selftests and add missing function imports
> 2. rename function name from symblink_oelocal_files_srctree to 
symlink_oelocal_files_srctree
> 3. fix indendation

I'm afraid the indentation is still all over the place; however, I have taken 
the liberty of fixing it (along with a few other minor style issues) and have 
pushed the result as paule/devtool-menuconfig.

Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre




Return-Path: <ross.burton@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BCC1D7F319
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 09:19:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Aug 2019 02:19:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="164600580"
Received: from mekarim-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.49.129])
	by orsmga007.jf.intel.com with ESMTP; 05 Aug 2019 02:19:16 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190802203719.20437-1-ross.burton@intel.com>
	<20190802203719.20437-5-ross.burton@intel.com>
	<CAMKF1soKtwNUY6SchZLPH8oHbbUiLabEir+JJD1_FdhHqGfhEw@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <919ee9f0-c746-018e-3b88-c3c8ea1fd8dd@intel.com>
Date: Mon, 5 Aug 2019 10:19:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soKtwNUY6SchZLPH8oHbbUiLabEir+JJD1_FdhHqGfhEw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/9] libxx86dga: remove obsolete client libary
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
X-List-Received-Date: Mon, 05 Aug 2019 09:19:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 04/08/2019 01:49, Khem Raj wrote:
> Ross
> 
> I am seeing
> 
> https://errors.yoctoproject.org/Errors/Details/257733/
> https://errors.yoctoproject.org/Errors/Details/257734/
> 
> I wonder if they are related to this series

I thought I solved this, maybe a patch I meant to drop had sneaked back 
in.  I'll look and fix.

Ross


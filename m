Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9E10274898
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 13:01:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2018 06:01:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,390,1520924400"; d="scan'208";a="55724082"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 May 2018 06:01:08 -0700
To: "Vignesh Rajendran (RBEI/ECF3)" <Vignesh.Rajendran@in.bosch.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1525672255-24026-1-git-send-email-vignesh.rajendran@in.bosch.com>
	<44ef14450ded42d4a6d74278de3ca3ad@in.bosch.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f856913e-77b1-e6d8-7fa3-7dd781714f17@linux.intel.com>
Date: Wed, 16 May 2018 15:53:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <44ef14450ded42d4a6d74278de3ca3ad@in.bosch.com>
Subject: Re: [meta-oe][PATCH] package.bbclass: provide debug sources in externalsrc -dbg packages
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
X-List-Received-Date: Wed, 16 May 2018 13:01:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/16/2018 03:11 PM, Vignesh Rajendran (RBEI/ECF3) wrote:
> As I am new to the patch submission, anyone can explain how long this 
> process will take for acceptance in master/next release?
> 
> After several days of waiting by watching OE-mailing thread for any 
> reply for the patch, Now I had a feeling like the patch may have been 
> missed.

Generally we don't positively acknowledge the patches, to reduce the 
amount of noise on the mailing list. If the patch doesn't show up in 
master after a week or two, do ping or resend.


Alex


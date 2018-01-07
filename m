Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C48A3786B2
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 12:19:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jan 2018 04:19:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,325,1511856000"; 
   d="scan'208";a="8769231"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 07 Jan 2018 04:19:26 -0800
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <1515227515-18557-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <55c68d8f-261f-5406-77c0-d59365a754e4@linux.intel.com>
Date: Sun, 7 Jan 2018 14:19:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1515227515-18557-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] [PATCH] bjam-native: 1.65.1 -> 1.66.0
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
X-List-Received-Date: Sun, 07 Jan 2018 12:19:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/06/2018 10:31 AM, Huang Qiyu wrote:
> 1.Upgrade bjam-native form 1.65.1 to 1.66.0
> 2.Upgrade boost form 1.65.1 to 1.66.0

bjam is the build tool for boost that's packaged with it, so the patch 
should really be titled 'boost: update etc.'

Alex


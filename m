Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1DFE578740
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:08:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 06:08:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,401,1511856000"; d="scan'208";a="21927476"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Jan 2018 06:08:45 -0800
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
	<1516716352-32735-2-git-send-email-maxin.john@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2c856793-9666-2c50-368b-275df8d04bbb@linux.intel.com>
Date: Tue, 23 Jan 2018 16:02:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1516716352-32735-2-git-send-email-maxin.john@intel.com>
Subject: Re: [PATCH 01/12] freetype: upgrade to version 2.9
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
X-List-Received-Date: Tue, 23 Jan 2018 14:08:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/23/2018 04:05 PM, Maxin B. John wrote:
> 2.8.1 -> 2.9
> 
> Change in LIC_FILES_CHKSUM is due to change of URL www.freetype.org
> from http to https.

Let's see if the patchtest tells to change this to a tag; it should :)

Alex


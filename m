Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5BCF47521F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 06:17:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Apr 2018 23:17:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,426,1517904000"; d="scan'208";a="41802076"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 08 Apr 2018 23:17:53 -0700
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1522837858.git.Qi.Chen@windriver.com>
	<2e27990d1f27a0de84fc204caf77c28e5015173e.1522837858.git.Qi.Chen@windriver.com>
	<11a298c3-7fed-c73e-be12-0ed099fca145@linux.intel.com>
	<eeaa06cb-34e8-4b94-ee71-047d26894372@linux.intel.com>
	<ef659b6b-41ab-2019-52ad-b00f10c131f2@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <1e1b8dd4-799a-86f9-6579-1bc35816db89@linux.intel.com>
Date: Mon, 9 Apr 2018 09:11:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <ef659b6b-41ab-2019-52ad-b00f10c131f2@windriver.com>
Subject: Re: [PATCH 1/1] rpm: remove dbus dependency for rpm-native
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
X-List-Received-Date: Mon, 09 Apr 2018 06:17:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/08/2018 10:57 AM, ChenQi wrote:
> Thanks for your advice.
> I've sent out a new patch, which adds dbus option to configure.ac and 
> then disables it for rpm-native.

Thanks. Can you submit the patch upstream please? Open a pull request here:
https://github.com/rpm-software-management/rpm

Alex


Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 47DF378243
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 14:03:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Oct 2017 07:03:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,483,1500966000"; d="scan'208";a="1203001219"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 06 Oct 2017 07:03:13 -0700
To: Andrej Valek <andrej.valek@siemens.com>,
	"Burton, Ross" <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1504593353-7409-1-git-send-email-andrej.valek@siemens.com>
	<1507274867-26612-1-git-send-email-andrej.valek@siemens.com>
	<17970e95-8d1a-a79d-f02a-2e24accb49f1@linux.intel.com>
	<53132579-3c1a-7adb-bb13-4518d9ba3543@siemens.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2840d54c-8c0f-2ea0-2c81-6acd99953371@linux.intel.com>
Date: Fri, 6 Oct 2017 16:59:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <53132579-3c1a-7adb-bb13-4518d9ba3543@siemens.com>
Subject: Re: [PATCH v3] libxml2: 2.9.4 -> 2.9.6
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
X-List-Received-Date: Fri, 06 Oct 2017 14:03:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/06/2017 04:19 PM, Andrej Valek wrote:
> It is continue in discussion from thread
> (http://lists.openembedded.org/pipermail/openembedded-core/2017-September/142891.html).
> 
> For the explanation CVE-* fx-* patches have been removed due to
> backports. Ptest patch has been modified to adapt new changes in sources.

What I meant is that you need to put this information into the commit 
message itself. Be generous with it; the more it contains, the better.


Alex


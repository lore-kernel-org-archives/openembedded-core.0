Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2CCBC75393
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 16:33:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jun 2018 09:33:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,476,1520924400"; d="scan'208";a="234269373"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 04 Jun 2018 09:33:30 -0700
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-core@lists.openembedded.org
References: <20180604162654.472-1-dev@sashko.rv.ua>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c74fa38c-20fc-3acd-0dac-bbd6216d5a25@linux.intel.com>
Date: Mon, 4 Jun 2018 19:33:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180604162654.472-1-dev@sashko.rv.ua>
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: Re: [meta-oe][PATCH v2] minicom: fix SRC_URI
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
X-List-Received-Date: Mon, 04 Jun 2018 16:33:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/04/2018 07:26 PM, Oleksandr Kravchuk wrote:
> +SRC_URI = "${DEBIAN_MIRROR}/main/m/http://http.debian.net/main/m/minicom/minicom_${PV}.orig.tar.gz \

^^^ hasty editing? :-)

Alex


Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 397987D279
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 02:00:00 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id EE89F1C0266
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 13:59:59 +1200 (NZST)
To: openembedded-core@lists.openembedded.org
References: <20190606020544.26181-1-douglas.royds@taitradio.com>
	<20190607012157.16757-1-douglas.royds@taitradio.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <ed09179e-d600-d4e8-05e2-d7c9d45bd432@taitradio.com>
Date: Tue, 11 Jun 2019 13:59:59 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607012157.16757-1-douglas.royds@taitradio.com>
Subject: Re: [PATCH v2] json-c: Disable icecc to avoid implicit-fallthrough warning as error
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
X-List-Received-Date: Tue, 11 Jun 2019 02:00:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

Please disregard this one, I've sent a recipe update to pick up the new 
--disable-werror configure option.



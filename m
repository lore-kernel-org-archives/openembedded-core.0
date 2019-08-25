Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BAEE17F64D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2019 17:23:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Ghmg2l35z29
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2019 19:23:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566753795;
	bh=Lm/LTgW1z2C5i1b/GDuqoVx+PCiDWUX50tFu+b9Pxp0=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=kckuNzqETAFxtP/oDGMHOttQHq979tdLA+2GESqYwDJV780/M8A4YFgj9oPkduNZl
	p8nV2YrurKRAhl3reKlNQE0u4UHLBrjcjyDhh+3eyxhLMVnzdNEbcoXrogIy7GImSE
	Z8ltma0559mMb8a/hCUtRn52lPlqQCzU4lfcJtdYWpqkRP0ZJAxHUCTMeKKkoN0KeE
	qbPGchEPjz9L2NC3bDsIYPfHXEz5ai6CwuRNZOJvrkiFF5ipeZkmCGoDBUZz9SqGBC
	p3ij9dAw19s6IMNH2TvOsOQoSHq2sX8H9EHEz7uPZfaa+zcDnA0ulJV0CFXzeQs7w9
	6DZmgovg7u+STpqGMRGTJC3pxfkjAI8JwT32egXjqKiyZt6226abpOTG89SNt0zFiM
	MLVHhTOr2F4N0qO7wuZH1Jzgmxf6M3Uufl0zTQWt3jU6qPJ8LDtj6+E/xR+c3Ix1m5
	fEamp4HI08dLujEEKJ+Hyw+fn3IT9BlnA7qN9qM9TGHhyULGqXwafsVj01xOk0LtIv
	riIf3PfOORN2VgB32SjGitY6rVZ135ESAmoIIq893IvuyS1NDJ7pKMAYckM4UP7IEc
	IiPH2Eh6gZb0xIauvoOVnoDSXMhz17LpJBqKO53+kcPXmH044ajhkOGxD97n5ewC/Y
	aHQUNhuxylvV9iHy13+7hayI=
Date: Sun, 25 Aug 2019 20:23:13 +0300
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190825172313.GA32283@localhost>
References: <20190825172116.23759-3-bunk@stusta.de>
MIME-Version: 1.0
In-Reply-To: <20190825172116.23759-3-bunk@stusta.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [PATCH] Remove LSB support bits
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
X-List-Received-Date: Sun, 25 Aug 2019 17:23:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Please ignore this patch, wrong list.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



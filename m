Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 45CE16C47C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 16:46:37 +0000 (UTC)
Received: from [10.80.45.159] (unknown [71.69.156.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6774A206BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 16:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1542732398;
	bh=Ghv61I4AxuO3J0qYq/fXBMbQtv39MKUE/cHuX8Af/H4=;
	h=To:From:Subject:Date:From;
	b=zngDKjpw4z7QAlIzZf38Yb6GLR3rDBj2mOEi1R9B9UfeLaLoqm3odwWNTAtRaaatU
	l4ptpDEGhfFIx6K51zXbKIzR8BzHsAaJj2qNed95RSQLRIuta8KcQYvhLzHIN5DgSF
	gZH4811zHNfpIYl7dKN4WyE2BjbZqW25aLa0D/iQ=
To: openembedded-core@lists.openembedded.org
From: Sinan Kaya <okaya@kernel.org>
Message-ID: <6d1b7e82-ca5a-e664-a709-3a1a9fe06c4e@kernel.org>
Date: Tue, 20 Nov 2018 11:46:36 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
Subject: [sumo] [PATCH v1] python: CVE-2018-1061
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
X-List-Received-Date: Tue, 20 Nov 2018 16:46:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

It looks like this patch was not applied.

https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg116341.html

Any reasons, why?


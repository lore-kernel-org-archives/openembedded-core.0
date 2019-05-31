Return-Path: <philn@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 538E47E55C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 08:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID;
	bh=1xSwE/RK7bTG9UHUByVf0hERc71k6HqG+fQKuPbyQwI=; 
	b=XmBE4Ja6vJjfjCTq3n9WIi753eofXIb8ER0F0RdS/JJdbHZtTC7cfV3xrz0JkpX9+G8nbwZ/p478Aao0/O2n5TWAB1vFXc6dPazsvmZBAe2cXU3WEefJn6OWN2Oqe7JttB/rKXSjDpiP9mu3rbT9N3z7R6jJ6m6DPCCnodCa0z6P1oSRoeTnrfzZvNlq8ticfnujCGsezcHCXdQot10P52Y5abGMyGFpXLsg5929GQAEWqkOSGIWlt9XXag0earkJbAzqJUmf1EKq2nxdL/x3Rqzby8yARByDzgmewRgi6IJ125j5VC9KNRCHScd3e+AxzO+x9j7Uo0Mc9RmGSrnUg==;
Received: from 216.red-88-16-195.dynamicip.rima-tde.net ([88.16.195.216]
	helo=[192.168.1.41]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1hWdNI-000838-QV for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 10:58:57 +0200
Message-ID: <ecdb04f69a181c8d6fc87fab8af07b8a197ae7e8.camel@igalia.com>
From: Philippe Normand <philn@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 09:58:47 +0100
In-Reply-To: <0d70053e5742b8a3741313cfc2f299d8b69d63c0.camel@igalia.com>
References: <69e7b572a514abba106b28255461cf17720e68e1.camel@igalia.com>
	<CAJ86T=VEKBv21mMo9cxh-VG8OstFF5bwte_g41k2=RUNAcbnRA@mail.gmail.com>
	<0d70053e5742b8a3741313cfc2f299d8b69d63c0.camel@igalia.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2] cmake: Use compiler launcher variable when ccache is enabled
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
X-List-Received-Date: Fri, 31 May 2019 08:58:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Please let me know if there's anything left to address with this patch
:)

Philippe



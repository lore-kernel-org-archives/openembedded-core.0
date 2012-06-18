Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SgiIw-0000GP-Tc
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 22:12:07 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga01.intel.com with ESMTP/TLS/RC4-MD5; 18 Jun 2012 13:01:21 -0700
Received: by dano14 with SMTP id o14so7255603dan.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 13:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=a7bXS9mMj2ebunppuFTuZzhus1T8XRjAr9/EBm6qPXM=;
	b=NkCs3Bm13n0/2IdFlhLYKWbbc9Y6aktdp6uvTStz9+3geGIvoiNHpn6YffLPN4xPO8
	2p6qa3IO9kx0uCmYGIxGM3i7phaxXJ5LHeoSfF1JaO14uvKeegIBB1syDswZFGrUaBJA
	NV36gqH6iXTZWu7z/sfEPChfJ2NBPwrb7ZBqGDJxY7sOCeTeCboa62IVO2OLedbZHXRL
	M/c0oXF+wEOVKF3TNXfsqA6mjVWXzif6iHbfGq7C2k4Z2s10KCotWk/NvWbqTIgvPbNQ
	YvtXu3LDUo7iEze764qgdkTsGuSrwlDstHlFplyOZ6r7Omez6RXLq+42Vz3i0ZTTjrZK
	NpbA==
Received: by 10.68.226.226 with SMTP id rv2mr55395340pbc.101.1340049681266;
	Mon, 18 Jun 2012 13:01:21 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id wk3sm24961087pbc.21.2012.06.18.13.01.18
	(version=SSLv3 cipher=OTHER); Mon, 18 Jun 2012 13:01:20 -0700 (PDT)
Message-ID: <4FDF8907.4060500@intel.com>
Date: Mon, 18 Jun 2012 13:01:11 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1340038108.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1340038108.git.scott.a.garman@intel.com>
X-Gm-Message-State: ALoCoQmZnpz2Nxszug4mqXzymx776bvg7si6uJqHuN5rGff9fmucQasfO3rhrJqYjO7npdWV2R9W
Subject: Re: [PATCH 0/6] denzil pull request 3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jun 2012 20:12:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/18/2012 12:57 PM, Scott Garman wrote:
> Hello,
>
> This is the third pull request for the oe-core denzil branch, based on
> a set of commits I've been testing from my sgarman/denzil-next branch.
>
> These commits have undergone the following testing on the autobuilder:
>
> nightly:
>

Forgot the url here:

http://autobuilder.yoctoproject.org:8010/builders/nightly/builds/518

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center



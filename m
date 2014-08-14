Return-Path: <sledz@dresearch-fe.de>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id F069D60889
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:42:44 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id w62so1186891wes.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 07:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=t6ku5WirRdP2Qzw82DKkjoh//HQWZ+uEnvxz5HJSo8Y=;
	b=YyOBObGE3zinyIevpdp8zMe5QutQAq8QVDvzbJnyBf6KrNQyF3IrB6nn2UfGXa1htg
	C/RKT9p4j6nN87fYsUTxL313Jnxt5ba9pe/HdzaZIrxbswJYFAoerCZ0ZdeJDpL4NdBW
	4I84Ol7CHm0tX8eIyb5bdP8yZa55/QYxtN5XBrWGN2J6loeNwzpYKr2AzOSsY5GTSL4n
	ShGgDfPbD0Cdf+3JdpLwspSmayKf+II5o9w8JbLgBZol6IDECaNTYOv2BdGSNkS9U4Zn
	fbf0C67uKNMY+DbENGL9pI1chY2Q+oMTpNhNxw2ZEtDvZcijNQsFV8MWtJI3NHFVy61R
	QqnA==
X-Gm-Message-State: ALoCoQkn+1m5a4GMokWU2+QV135dita0F2M4WsGbJZQQzyIa1OJ/Vpu3ZfwsG844Y1s/igEOTqdq
X-Received: by 10.181.13.112 with SMTP id ex16mr41157044wid.58.1408027363825; 
	Thu, 14 Aug 2014 07:42:43 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id
	x11sm11905671wjr.15.2014.08.14.07.42.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 07:42:42 -0700 (PDT)
Message-ID: <53ECCADF.9040400@dresearch-fe.de>
Date: Thu, 14 Aug 2014 16:42:39 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <53E89286.7050303@dresearch-fe.de>
In-Reply-To: <53E89286.7050303@dresearch-fe.de>
Subject: Re: Ralink RT3572/RT5572?
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
X-List-Received-Date: Thu, 14 Aug 2014 14:42:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 11.08.2014 11:53, Steffen Sledz wrote:
> Are the linux kernel modules for Ralink WiFi-USB devices with RT3572 and/or RT5572 (available from <http://www.mediatek.com/en/downloads/>) still integrated in an OE-Layer?
> 
> If not, what would be the right place for them (openembedded-core, meta-networking, or something else)?

Ping!

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


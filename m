Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 797E671B0B;
	Thu,  2 Feb 2017 00:07:46 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id 189so79355pfu.3;
	Wed, 01 Feb 2017 16:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=V/he/56y5vf+MwygKOgXV5skfCNqTndggeWczeyTViw=;
	b=IKwHx831lp0Zj/sbmF5tjv0vqTSN0UkWSZmrHh5iPD9WgWtgv5tlIFtiyhqy9rL8ol
	yAtFbpmVqN9uWihVM5X32oAWEgLSPzvq8aUZ8RY6h5sWu6T6usYcRqjkFWxdKR+urjnq
	hsDv3+EEockHja6532c7ZfqF9DcuR7UHJhG/deS1WiCoUVIL1xJbUwixqQn9ixZTCl62
	rL6YX32l1KCMe/ZDHX2lZvWpsfvU7TwqKQLs4IiZ0/RJWkqRqi46aSCeoKYU0jKwpohW
	3QFgxXhNqjmtMjqKqCsyi/a+kImx6hobS+bd0/SEMrreXJ/M8n8lZxS+Kaqlh5hy0yID
	l6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=V/he/56y5vf+MwygKOgXV5skfCNqTndggeWczeyTViw=;
	b=lq9+A3h6pIetDbixUcdyIUSnjQyLdLZCl51Dp+N1W4wrRvg2raP/RX1b035r4MokTK
	5JFr0WAXiTMPjBOZWV7MaEQlIkvy4BJF7zZrEzvrAfp/eqwoj45bIQYyUONh1e+7nhWX
	bto7cB4yI+lM4exNvMQkaEyx6OXKmahcguYKT5SlGmsILpY+rvM+qDw6FrxFUJYXFDSd
	QbaKMqqfbQL1mfozbpKRy/dZwe/QTrssfVzF4t6sGSBJ94PB4eP9kfl1pDsdrqi2wSXm
	aVHQFt4xTDIITu5engjYPmFIK/3Mgiraxm24gClH+u8GaimMZvBsELF6a+kkdLur8NwB
	fA6Q==
X-Gm-Message-State: AIkVDXIf/0I59hSWc9HaqQ350GC7K8ULZqaZitmmne36F4WfGdrlt5R8eqLHPTiBDbQlwg==
X-Received: by 10.99.209.85 with SMTP id c21mr6932076pgj.147.1485994066361;
	Wed, 01 Feb 2017 16:07:46 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:d12f:3ef1:f4ff:7b5b?
	([2601:202:4001:9ea0:d12f:3ef1:f4ff:7b5b])
	by smtp.gmail.com with ESMTPSA id
	s64sm52507085pfe.27.2017.02.01.16.07.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Feb 2017 16:07:45 -0800 (PST)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <14809711-d018-2aaa-6faa-c410e16e1478@gmail.com>
Date: Wed, 1 Feb 2017 16:07:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
Subject: OEDEM minutes review for Portland
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
X-List-Received-Date: Thu, 02 Feb 2017 00:07:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,

I add the Title and conclusion for each issue noted in the last years 
OEDEM in Berlin. For those who signed up to take an action, please 
review http://openembedded.org/wiki/OEDAM_2017/  Either update the 
status on the wiki or send me an email if you want me to do it.   I am 
trying to get a current state for those issues before our next meeting 
in Feb.


kind regards,

Armin



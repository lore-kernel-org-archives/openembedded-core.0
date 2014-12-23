Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 244657270F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 12:30:30 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id hl2so6642254igb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 04:30:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=0ZdxVkTVTs0tDZlL+pmQt/bdO3aAvTpFvv12uBDAqj8=;
	b=f67IZryjQrjamFgHG1JYDAXu1f4TQhzK7aY0EoUUcb+sVtCNH//x51UI11oeZ6+vtL
	sIaqBqfahafE+YMg3VhRK4M+tWa4MobihQ63wymYlek+lwKisMcowE1ck8oqNryw1d4Q
	iM+vUyyWwJILtsuH8naRMlZW28RWU29xUmdd2tCJgCNE22Kn2xlk2U7sr0GUovVbgwzk
	Benlt5gepfQUjxiyw42l2jNGBFjxMKrFyimUOIgXkxjwXhnzVs+tM7TOr03YjP9FA3eB
	0Xw3D+sKUlboeFISEtTK9wT+qCwF+fkfbaXkd4OR1HQ6vDlDxlS/3jYYCsh5IpUbz6iO
	NkXw==
X-Gm-Message-State: ALoCoQm3q0BImHKYjWh4+x5R5brv1Veub0mTg5gn8WFOQ4dNtZ8zEyxsT3r1DfDbbZNU5YBfRn4c
X-Received: by 10.50.36.103 with SMTP id p7mr20909763igj.20.1419337830868;
	Tue, 23 Dec 2014 04:30:30 -0800 (PST)
Received: from [192.168.141.85] (dsl-69-172-87-20.acanac.net. [69.172.87.20])
	by mx.google.com with ESMTPSA id
	jh10sm1335260igb.12.2014.12.23.04.30.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Dec 2014 04:30:30 -0800 (PST)
Message-ID: <54996067.7080908@linaro.org>
Date: Tue, 23 Dec 2014 07:30:31 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1418984743.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1418984743.git.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 00/15] Developer workflow tools
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
X-List-Received-Date: Tue, 23 Dec 2014 12:30:38 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

I've written a quick tutorial about this work Paul and his co-workers
have been doing:
https://drive.google.com/file/d/0B3KGzY5fW7laQmgxVXVTSDJHeFU/view?usp=sharing

Tested-by: Trevor Woerner <trevor.woerner@linaro.org>

